class User::UserController < ApplicationController
  def show
  end

  def edit
   @user = User.find(current_user.id)
  end

  def favorite
  end

  def follow
  end

  def follower
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
