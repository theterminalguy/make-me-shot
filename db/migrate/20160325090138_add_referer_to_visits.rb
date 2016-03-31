class AddRefererToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :referer, :string
  end
end
