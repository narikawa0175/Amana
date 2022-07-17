class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @task = @user.tasks
   @task = Task.where("start_time >= ?", Date.today)
  end

  def edit
  end
  
  def update
  end
  
  def withdrawal
  end
end
