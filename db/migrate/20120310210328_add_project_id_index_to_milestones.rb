class AddProjectIdIndexToMilestones < ActiveRecord::Migration
  def change
    add_index(:milestones, :project_id)
  end
end
