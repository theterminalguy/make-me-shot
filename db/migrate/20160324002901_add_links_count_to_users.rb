class AddLinksCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :links_count, :integer, default: 0
    add_index :users, :links_count
  end
end
