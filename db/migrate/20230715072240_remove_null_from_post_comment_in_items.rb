class RemoveNullFromPostCommentInItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :post_comment, true
  end
end
