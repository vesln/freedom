#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  belongs_to :assigned_user, :class_name => 'User'

  attr_accessible :title, :milestone_id, :state
  attr_accessible :assigned_user_id

  delegate :name, :to => :assigned_user, :prefix => true,
           :allow_nil => true
end
