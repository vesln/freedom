class AddCompletedTasksCountToMilestone < ActiveRecord::Migration
  def change
    add_column(:milestones, :completed_tasks_count, :integer, :default => 0)
  end
end
