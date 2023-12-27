class Admin::CommentsController < ApplicationController
  def index
  @user = User.find(params[:user_id])
  @comments = @user.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_user_comments_path(params[:user_id])
  end
end
