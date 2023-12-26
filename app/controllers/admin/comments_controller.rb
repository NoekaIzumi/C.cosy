class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @users = User.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_path(params[:post_id])
  end
end
