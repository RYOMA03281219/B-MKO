class AddItemidToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :item_id, :integer
    add_column :favorites, :customer_id, :integer
  end
end
