class NotNullColumnsInTask < ActiveRecord::Migration
  def up
    change_column(:tasks, :title, :string, :null => false)
    change_column(:tasks, :project_id, :integer, :null => false)
    change_column(:tasks, :user_id, :integer, :null => false)
  end

  def down
    change_column(:tasks, :title, :string, :null => true)
    change_column(:tasks, :project_id, :integer, :null => true)
    change_column(:tasks, :user_id, :integer, :null => true)
  end
end
