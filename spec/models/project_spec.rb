require "rails_helper"

describe Project do
  before { Project.delete_all }

  context "all is good" do
    it "sets #groups to an empty array by default" do
      project = Project.create!(name: "foo")
      expect(project.groups).to eq([])
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "breakage" do
    it "no longer sets #groups to an empty array by default and fails because of an SQL ConstraintException" do
      project = Project.create!(name: "bar")
      expect(project.groups).to eq([])
    end
  end
end
