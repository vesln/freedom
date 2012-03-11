class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :milestone_id
      t.integer :assigned_user_id
      t.string :state
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end

    add_index(:tasks, :milestone_id)
    add_index(:tasks, :assigned_user_id)
    add_index(:tasks, :project_id)
    add_index(:tasks, :user_id)
  end
end
