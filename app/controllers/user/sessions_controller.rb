# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :check_user_suspended


  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def check_user_suspended
    if current_user && current_user.suspended?
      sign_out current_user
      flash[:alert] = "このアカウントは利用停止中です。管理者にお問い合わせください。"
      redirect_to root_path
    end
  end


end
