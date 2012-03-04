class Milestone < ActiveRecord::Base
  belongs_to :project

  # TODO: attr_protected :project_id ?

  validates_presence_of :name
  # TODO: add validates_presence_of :project_id

  scope :for_project, lambda { |project| where :project_id => project.id }
end
