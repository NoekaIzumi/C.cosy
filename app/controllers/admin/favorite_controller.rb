class Admin::FavoriteController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

end
