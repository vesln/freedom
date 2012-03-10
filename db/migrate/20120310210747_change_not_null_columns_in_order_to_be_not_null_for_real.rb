class ChangeNotNullColumnsInOrderToBeNotNullForReal < ActiveRecord::Migration
  def up
    change_column(:milestones, :name, :string, :null => false)
    change_column(:projects, :name, :string, :null => false)
  end

  def down
    change_column(:milestones, :name, :string, :null => true)
    change_column(:projects, :name, :string, :null => true)
  end
end
