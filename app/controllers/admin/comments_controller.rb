class Admin::CommentsController < ApplicationController
  def index#任意のユーザーのコメント一覧
  @user = User.find(params[:user_id])
  @comments = @user.comments
  end

  def destroy#任意のユーザーのコメント一覧から任意のコメントを削除
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_user_comments_path(params[:user_id])
  end
end
