class RemoveStarFromcustomer < ActiveRecord::Migration[6.1]
  def change
    def up
    remove_column :items, :star, :integer
      end

    def down
      add_column :customers, :star, :string
    end
  end
end
