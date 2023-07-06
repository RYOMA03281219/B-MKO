class AddStarToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :star, :string
  end
end
