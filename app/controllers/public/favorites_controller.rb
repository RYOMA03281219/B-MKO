class Public::FavoritesController < ApplicationController

  def create
    profile_image = PostImage.find(params[:profile_image_id])
    favorite = current_customer.favorites.new(profile_image_id: profile_image.id)
    favorite.save
    redirect_to profile_image_path(profile_image)
  end

  def destroy
    profile_image = PostImage.find(params[:profile_image_id])
    favorite = current_customer.favorites.find_by(profile_image_id: profile_image.id)
    favorite.destroy
    redirect_to profile_image_path(post_image)
  end

end
