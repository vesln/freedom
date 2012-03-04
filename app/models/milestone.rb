class Milestone < ActiveRecord::Base
  scope :for_project, lambda { |project| where :project_id => project.id }
end
