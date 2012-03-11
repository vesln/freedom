#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Task < ActiveRecord::Base
  STATES = %w{ new open resolved hold invalid }

  belongs_to :project
  belongs_to :milestone
  belongs_to :assigned_user, :class_name => 'User'
  belongs_to :user

  attr_accessible :title, :milestone_id, :state
  attr_accessible :assigned_user_id, :description

  validates_presence_of :title
  validates_presence_of :project_id
  validates_inclusion_of :state, :in => STATES
  validates :milestone, :belongs_to => :project

  delegate :name, :to => :assigned_user, :prefix => true,
           :allow_nil => true

  def milestone_name
    milestone ? milestone.name : 'None'
  end
end
