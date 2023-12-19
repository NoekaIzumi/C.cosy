class HomeController < ApplicationController
  def top
  end

  def about
  end

  def search#検索画面
    #キーワード検索機能
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end

    #タグ検索機能
  end


  def searched#検索結果画面

  end


end
