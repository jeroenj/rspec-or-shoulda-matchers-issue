require "rails_helper"

describe Project do
  before { Project.delete_all }

  context "all is good" do
    it "sets #groups to an empty array and category to none by default" do
      project = Project.new(name: "foo")
      expect(project.changes).to eq({ "name" => [nil, "foo"] })
      expect(project.save).to eq(true)
      expect(project.groups).to eq([])
      expect(project.category).to eq("none")
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "breakage" do
    it "no longer sets #groups to an empty array and category to none by default and fails because of an SQL ConstraintException" do
      project = Project.new(name: "bar")
      expect(project.changes).to eq({ "groups" => [[], []], "name" => [nil, "bar"] })
      expect(project.groups).to eq([])
      expect(project.category).to eq("none")
      expect { project.save }.to raise_error(ActiveRecord::StatementInvalid).with_message(/SQLite3::ConstraintException: NOT NULL constraint failed/)
    end
  end
end
