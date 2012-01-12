class CreateUsersProjects < ActiveRecord::Migration
  def change
    create_table :users_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :access

      t.timestamps
    end
  end
end
