class RewardsController < ApplicationController
  def create
   @reward = Reward.new(reward_params)
   @reward.user_id = current_user.id
   @reward.save
   redirect_to challenges_path
  end

  def update
   @reward = Reward.find(params[:id])
   @user = User.find(current_user.id)
   if @reward.cost_point < @user.total_point
    @user.total_point -= @reward.cost_point
    @user.update(total_point: @user.total_point)
    redirect_to challenges_path
   else
    flash[:alert] = "ポイントが足りません"
    redirect_to challenges_path
   end
  end

  def destroy
   @reward = Reward.find(params[:id])
   @reward.destroy
   redirect_to challenges_path
  end
  
  private
  
  def reward_params
   params.require(:reward).permit(:reward_name,:cost_point)
  end
end
