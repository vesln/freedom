class Milestone < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :name

  scope :for_project, lambda { |project| where :project_id => project.id }
end
