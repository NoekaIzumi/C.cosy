class User::PostController < ApplicationController

  def index

    @posts = Post.includes(:post_tags)
    @posts = @posts.where('restaurant_name LIKE ? OR closest LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?
    @current_user = current_user

    # 下書き状態の投稿を表示しないようにフィルタリング
    @posts = @posts.where.not(status: :draft)

    @draft_posts = @current_user.posts.where(status: :draft) # 下書き状態の投稿を取得
  end

  def new
    @post=Post.new
    @user = User.find(current_user.id)
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
    @user = current_user
    @current_user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments= Comment.where(post_id: @post.id)
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def update
    @post = Post.find(params[:id])

    if params[:post][:image].present?
      @post.image.attach(params[:post][:image])
    end
      if @post.update(post_params)
        redirect_to user_post_path(@post)
      else
      	render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.is draft?
      redirect_to draft_user_post_index_path(params[:user_id])
    else
      redirect_to user_post_path(params[:post_id])
    end

  end

  def draft
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
    @draft_posts = current_user.posts.where(status: :draft)
  end

  def publish
    @post = Post.find(params[:id])
      if @post.update(status: :published)
        redirect_to user_post_path(@post), notice: "投稿を公開しました。"
      else
        redirect_to user_post_path(@post), alert: "投稿の公開に失敗しました。"
      end
  end


  private

  def post_params
    params.require(:post).
    permit(:restaurant_name, :image, :budget, :closest, :distance, :user_id, :status, tag_ids: [])
  end

end
