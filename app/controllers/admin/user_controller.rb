class Admin::UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def favorite
  end

 # フォロー一覧
def follows
  user = User.find(params[:id])
  @users = user.following_users
end

# フォロワー一覧
def followers
  user = User.find(params[:id])
  @user = user.follower_users
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
