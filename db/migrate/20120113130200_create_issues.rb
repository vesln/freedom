class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.integer :author_id, :null => false
      t.integer :project_id, :null => false
      t.integer :milestone_id, :null => true
      t.integer :assignee_id, :null => true
      t.integer :state, :default => 0, :null => false

      t.timestamps
    end
  end
end
