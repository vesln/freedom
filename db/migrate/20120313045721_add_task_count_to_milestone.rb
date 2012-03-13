class AddTaskCountToMilestone < ActiveRecord::Migration
  def change
    add_column(:milestones, :task_count, :integer, :default => 0)
  end
end
