class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :long
      t.string :short
      
      add_index :links, :user_id 
      t.timestamps null: false
    end
  end
end
