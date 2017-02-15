class Project < ActiveRecord::Base
  serialize :groups, Array

  validates :name, presence: true, uniqueness: true
end
