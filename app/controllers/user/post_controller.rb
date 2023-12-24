class User::PostController < ApplicationController

  def index

    @posts = Post.includes(:post_tags)
    @posts = @posts.where('restaurant_name LIKE ? OR closest LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?
  end

  def new
    @post=Post.new
  end

  def create
  @post = current_user.posts.build(post_params)
  tag_ids = params[:post][:tag_ids] ||= []
  @post.tag_ids = tag_ids
   if @post.save
    redirect_to posts_path
   else
    puts @post.errors.full_messages
     render :new
   end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments= Comment.where(post_id: @post.id)
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
  end

  def edit
  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end

end
