class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  belongs_to :assigned_user, :class_name => 'User'

  attr_accessible :title, :milestone_id, :state
  attr_accessible :assigned_user_id
end
