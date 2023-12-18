class User::UserController < ApplicationController
  def show
  end

  def edit
  end

  def favorite
  end

  def follow
  end

  def follower
  end

  def update
    @user = User.find(params[:id])
    @user.update
    @user.image.attach(params[:user][:image])
    redirect_to user_user_show_path

  end
end
