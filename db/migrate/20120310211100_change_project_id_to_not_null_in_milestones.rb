class ChangeProjectIdToNotNullInMilestones < ActiveRecord::Migration
  def up
    change_column(:milestones, :project_id, :integer, :null => false)
  end

  def down
    change_column(:milestones, :project_id, :integer, :null => true)
  end
end
