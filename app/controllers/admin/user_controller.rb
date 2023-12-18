class Admin::UserController < ApplicationController
  def index
    @users = User.all
  end

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

  def suspend
    @user = User.find(params[:id])
    @user.update(suspended: true)
    redirect_to admin_user_path(@user), notice: 'ユーザーを利用停止にしました。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end

end
