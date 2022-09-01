class UsersController < ApplicationController
  before_action :self_user
 
  def show
   @user = User.find(params[:id])
   @tasks = @user.tasks.order(start_time: :desc)
   @task = @tasks.where(start_time: Time.zone.now.all_day)
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end
  
  def withdrawal
   @user = User.find(params[:id])
   @user.update(is_deleted: true)
   reset_session
   redirect_to root_path
  end
  
  private
  
  def user_params
   params.require(:user).permit(:name,:email)
  end
  
  def self_user
   @user = User.find(params[:id])
   unless @user == current_user
    redirect_to user_path(current_user.id)
   end
  end
end
