# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :user_state,only:[:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def user_state
  @user = User.find_by(email: params[:user][:email])
  return if !@user
   if @user.valid_password?(params[:user][:password]) && !@user.is_deleted?
   else
   redirect_to root_path,alert: '退会済みのユーザーです'
   end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
