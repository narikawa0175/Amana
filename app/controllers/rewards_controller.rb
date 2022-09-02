class RewardsController < ApplicationController
  def create
   @user = User.find(current_user.id)
   @challenges = @user.challenges
   @reward = Reward.new(reward_params)
   @rewards = @user.rewards
   @reward.user_id = current_user.id
   if @reward.save
    redirect_to challenges_path
   else
    render template: "challenges/index"
   end
  end

  def update
   @reward = Reward.find(params[:id])
   @user = User.find(current_user.id)
   if @reward.cost_point <= @user.total_point
    @user.total_point -= @reward.cost_point
    @user.update(total_point: @user.total_point)
    redirect_to challenges_path,notice: 'ポイントを消費しました'
   else
    redirect_to challenges_path,alert: 'ポイントが足りません'
   end
  end

  def destroy
   @reward = Reward.find(params[:id])
   if @reward.user_id == current_user.id
    @reward.destroy
    redirect_to challenges_path
   else
    redirect_to user_path(current_user.id)
   end
  end
  
  private
  
  def reward_params
   params.require(:reward).permit(:reward_name,:cost_point)
  end
end
