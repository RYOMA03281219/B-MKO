class RenameCustomerIdToItem < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :cutomer_id, :customer_id
  end
end
