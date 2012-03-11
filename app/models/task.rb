class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  belongs_to :assigned_user, :class_name => 'User'
end
