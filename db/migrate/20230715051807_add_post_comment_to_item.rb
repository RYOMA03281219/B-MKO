class AddPostCommentToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :post_comment, :string, null: false
  end
end
