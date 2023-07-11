class Public::PostImagesController < ApplicationController
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new　
  end
  
end
