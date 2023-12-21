class User::PostController < ApplicationController

  def index

   tag_id = params[:tag_id]
    if tag_id.present?
      @posts = Tag.find(params[:tag_id]).posts
    else
      @posts = Post.all
    end

   post_keyword = params[:post_keyword]
    if post_keyword.present?
      @posts = Post.where('post_keyword LIKE ?', "%#{params[:post_keyword]}%")
    else
      @posts = Post.all
    end

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
  end

  def edit
  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end

end
