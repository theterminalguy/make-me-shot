class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :link_id
      t.string :ip
      t.string :browser
      t.string :browser_version
      t.string :os

      add_index :visits, :link_id
      t.timestamps null: false
    end
  end
end
