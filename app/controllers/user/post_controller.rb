class User::PostController < ApplicationController

  def index

    @posts = Post.all.order(created_at: :desc)
    @posts = Post.includes(:post_tags)
    @posts = @posts.where('restaurant_name LIKE ? OR closest LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?
    @current_user = current_user

    # 下書き状態の投稿を表示しないようにフィルタリング
    @posts = @posts.where.not(status: :draft)
    if @current_user&.present?
      @draft_posts = @current_user.posts.where(status: :draft)
    end
  end

  def index_follows#フォローしているユーザーの投稿一覧
    @current_user = current_user
    @posts = Post.where(user_id: params[:id])
    # 下書き状態の投稿を表示しないようにフィルタリング
    @posts = @posts.where.not(status: :draft)
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
      if @post.published?
      flash[:notice] = "投稿しました。"
        redirect_to posts_path
      else
         flash[:notice] = "下書きに保存しました。"
        redirect_to user_post_path(@post)
      end
    else
       @errors = @post.errors
       render "new",status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @current_user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments= Comment.where(post_id: @post.id)
    # コメントを昇順で取得し、ページネーションを適用
    @comments = @post.comments.order(:created_at).page(params[:page]).per(7)
    # 他の人の下書き状態の投稿を表示しないようにフィルタリング
    if @post.draft? && @post.user != current_user
      redirect_to posts_path
    end
  end


  def edit
    @post = Post.find(params[:id])
    @current_user = current_user

    @user= @post.user
     unless @post.user.id == current_user.id
      redirect_to posts_path
     end
  end

  def update
    @current_user = current_user
    @post = Post.find(params[:id])
    if params[:post][:image].present?
      @post.image.attach(params[:post][:image])
    end

      if @post.update(post_params)
        if @post.published?
          flash[:notice] = "投稿を公開しました。"
        else
          flash[:notice] = "投稿を非公開にしました。"
        end
        redirect_to user_post_path(@post)
      else
        @errors = @post.errors
      	render :edit,status: :unprocessable_entity
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    if @post.draft?
      redirect_to draft_user_post_index_path(params[:user_id])
    else
      redirect_to posts_path
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
