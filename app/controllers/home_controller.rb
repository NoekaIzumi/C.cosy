class HomeController < ApplicationController
  def top
    
  end

  def about
    @current_user = current_user
  end

  def search
  
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

end
