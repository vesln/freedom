#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Task < ActiveRecord::Base
  STATES = %w(new open resolved hold invalid)
  COMPLETED = %w(resolved invalid hold)

  belongs_to :project
  belongs_to :milestone, :counter_cache => true
  belongs_to :assigned_user, :class_name => 'User'
  belongs_to :user

  attr_accessible :title, :milestone_id, :state
  attr_accessible :assigned_user_id, :description

  validates_presence_of :title
  validates_presence_of :project_id
  validates_inclusion_of :state, :in => STATES
  validates :milestone, :belongs_to => :project

  after_create  :update_completed_counter_cache
  after_destroy :update_completed_counter_cache
  after_update  :update_completed_counter_cache

  delegate :name, :to => :assigned_user, :prefix => true,
           :allow_nil => true

  class << self
    def completed(milestone_id)
      where(:state => Task::COMPLETED, :milestone_id => milestone_id) 
    end
  end

  def milestone_name
    milestone ? milestone.name : 'None'
  end

  private

  def update_completed_counter_cache
    return unless self.milestone
    milestone.completed_tasks_count = Task.completed(milestone.id).count
    milestone.save
  end
end
