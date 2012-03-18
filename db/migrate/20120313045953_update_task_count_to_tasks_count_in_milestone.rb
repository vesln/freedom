class UpdateTaskCountToTasksCountInMilestone < ActiveRecord::Migration
  def up
    remove_column(:milestones, :task_count)
    add_column(:milestones, :tasks_count, :integer, :default => 0)
  end

  def down
    add_column(:milestones, :task_count, :integer, :default => 0)
    remove_column(:milestones, :tasks_count)
  end
end
