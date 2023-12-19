class Admin::PostController < ApplicationController

  def index
  #@user = User.find(params[:user_id])
  #@posts = @user.posts
  @posts = Post.all
  end

  def show

  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end


end
