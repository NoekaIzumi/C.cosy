class Admin::PostController < ApplicationController

  def index#投稿全体の一覧
  @posts = Post.all
  end

  def index_user#任意のユーザーの投稿一覧
  @posts = Post.where(user_id: params[:id])
  end

  def show

  end

  def comments #各ユーザーのコメント一覧

  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end


end
