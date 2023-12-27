class User::UserController < ApplicationController
  def show
    @current_user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def favorited
    
  end

 # フォロー一覧
def follows
  @current_user = current_user
  @user = User.find(params[:id])
  @users = @user.following_users
end

# フォロワー一覧
def followers
  @current_user = current_user
  @user = User.find(params[:id])
  @users = @user.follower_users
end

  def update
    @user = current_user
    @user.image.attach(params[:user][:image])
      if @user.update(user_params)
        sign_in :user, @user, bypass: true
        redirect_to edit_user_user_path(@user)
      else
      	render :edit
      end
  end

  def user_params
  params.require(:user).permit(:image, :name, :email, :password)
  end

end
