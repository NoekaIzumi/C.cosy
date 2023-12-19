# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


  def after_sign_in_path_for(resource)
    search_path
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
end
