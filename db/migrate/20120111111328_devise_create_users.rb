class DeviseCreateUsers < ActiveRecord::Migration
  def up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.trackable
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
  
  def down
    begin 
      drop_table :users 
    rescue 
      true 
    end
  end
end
