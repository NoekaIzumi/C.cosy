class User::FavoriteController < ApplicationController
  def create
   @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
   @post_favorite.save
   redirect_to user_post_path(params[:post_id])
  end

  def destroy
   @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
   @post_favorite.destroy
   redirect_to user_post_path(params[:post_id])
  end

  def index
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)

  end

end
