class ChallengesController < ApplicationController
  def new
   @challenge = Challenge.new
  end
  
  def index
   @user = User.find(current_user.id)
   @challenges = @user.challenges
   @reward = Reward.new
   @rewards = @user.rewards
  end

  def create
   @challenge = Challenge.new(challenge_params)
   @challenge.user_id = current_user.id
   @challenge.save
   redirect_to challenges_path
  end
  
  def complete
   @user = User.find(current_user.id)
   @challenge = Challenge.find(params[:id])
   if @challenge.complete && DateTime.now + 1
    @challenge.update(complete: false)
   else
    @user.total_point += @challenge.point
    @challenge.update(complete: true)
    @user.update(total_point: @user.total_point)
   end
   redirect_to challenges_path
  end
  
  def complete_all
   @user = User.find(current_user.id)
   @challenges = current_user.challenges
   @challenges.each do |challenge|
    @user.total_point += challenge.point
   end
   @challenges.update_all(complete: true)
   @user.update(total_point: @user.total_point)
   redirect_to challenges_path
  end
  
  def edit
  end

  def update
  end

  def destroy
   @challenge = Challenge.find(params[:id])
   @challenge.destroy
   redirect_to challenges_path
  end
  
  def destroy_all
   @challenges = current_user.challenges
   @challenges.each do |challenge|
    if challenge.complete
     challenge.destroy
    end
   end
   redirect_to challenges_path
  end
  
  private
  
  def challenge_params
   params.require(:challenge).permit(:name,:point)
  end
end
