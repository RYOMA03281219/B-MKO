class Public::PostCommentsController < ApplicationController
  def create
    get_image = PostImage.find(params[:get_image_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.get_image_id = get_image.id
    comment.save
    redirect_to get_image_path(get_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to get_image_path(params[:get_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
