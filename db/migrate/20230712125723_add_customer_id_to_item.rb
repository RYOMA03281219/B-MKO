class AddCustomerIdToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :cutomer_id, :integer, null: false
  end
end
