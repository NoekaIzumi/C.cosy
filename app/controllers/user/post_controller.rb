class User::PostController < ApplicationController

  def index
    @posts= Post.all(post_params)
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
  end

  def edit
  end

  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, tag_ids: [])
  end

end
