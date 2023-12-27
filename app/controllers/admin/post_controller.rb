class Admin::PostController < ApplicationController
  
before_action :authenticate_admin!

  def index#投稿全体の一覧
  @posts = Post.all
  end

  def index_user#任意のユーザーの投稿一覧
  @posts = Post.where(user_id: params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comments= Comment.where(post_id: @post.id)
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end


end
