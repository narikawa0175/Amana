class ListsController < ApplicationController
  def index
   @user = User.find(current_user.id)
   @lists = @user.lists
  end

  def new
   @list = List.new
  end
  
  def create
   list = List.new(list_params)
   list.user_id = current_user.id
   list.save
   redirect_to lists_path
  end
  
  def destroy
   list = List.find(params[:id])
   list.destroy
   redirect_to lists_path
  end
  
  private
  
  def list_params
   params.require(:list).permit(:name)
  end
end
