#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Milestone < ActiveRecord::Base
  attr_accessible :name

  belongs_to :project
  has_many :tasks
  has_many :completed_tasks, :class_name => 'Task', :conditions => {:state => Task::COMPLETED}

  validates_presence_of :name
  validates_presence_of :project_id
end
