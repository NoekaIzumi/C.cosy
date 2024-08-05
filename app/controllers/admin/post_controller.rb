class Admin::PostController < ApplicationController

before_action :authenticate_admin!

  def index#投稿全体の一覧
  @posts = Post.all
    # 下書き状態の投稿を表示しないようにフィルタリング
    @posts = @posts.where.not(status: :draft)
  end

  def index_user#任意のユーザーの投稿一覧
    @posts = Post.where(user_id: params[:id]).where.not(status: :draft)
    # 下書き状態の投稿を表示しないようにフィルタリング
  end

  def show
    @post = Post.find(params[:id])
    @comments= Comment.where(post_id: @post.id)
   # コメントを昇順で取得し、ページネーションを適用
    @comments = @post.comments.order(:created_at).page(params[:page]).per(7)
  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end


end
