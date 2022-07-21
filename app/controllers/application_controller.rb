class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :user_state,only:[:create]
 
 def after_sign_in_path_for(resource)
  user_path(current_user.id)
 end
 
 protected
 
 def user_state
  @user = User.find_by(email: params[:user][:email])
  return if !@user
  if @user.valid_password?(params[:user][:password]) && !@user.is_deleted?
  else
   redirect_to root_path
  end
 end
 
 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
 end
end
