class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.text :goals
      t.integer :open_issues, :default => 0
      t.integer :closed_issues, :default => 0

      t.timestamps
    end
  end
end
