class TasksController < ApplicationController
  def index
   @list = List.find(params[:id])
   @tasks = params[:tag_id].present? ? Tag.find(params[:tag_id]).tasks : @list.tasks.order(params[:sort])
  end

  def new
   @task = Task.new
   @list = current_user.lists
  end
  
  def calendar
   @events = current_user.tasks
  end
  
  def create
   @task = Task.new(task_params)
   @task.user_id = current_user.id
   tag_list = params[:task][:tag_name].split(nil)
   @task.save
   @task.save_tag(tag_list)
   redirect_to index_tasks_path(@task.list_id)
  end

  def edit
   @task = Task.find(params[:id])
   @task_tags = @task.tags
  end
  
  def update
   @task = Task.find(params[:id])
   tag_list = params[:task][:tag_name].split(nil)
   @task.update(task_params)
   @task.save_tag(tag_list)
   redirect_to index_tasks_path(@task.list_id)
  end
  
  def destroy
   @task = Task.find(params[:id])
   @task.destroy
   redirect_to index_tasks_path(@task.list_id)
  end
  
  def destroy_all
   @list = List.find(params[:id])
   @tasks = @list.tasks
   @tasks.each do |task|
    if task.complete
     task.destroy
    end
   end
   redirect_to index_tasks_path(@list.id)
  end
  
  def complete
   @task = Task.find(params[:id])
   if @task.complete
    @task.update(complete: false)
   else
    @task.update(complete: true)
   end
   redirect_to index_tasks_path(@task.list_id)
  end
  
  def complete_all
   @list = List.find(params[:id])
   @tasks = @list.tasks
   @tasks.update_all(complete: true)
   redirect_to index_tasks_path(@list.id)
  end
  
  private
  
  def task_params
   params.require(:task).permit(:name,:explanation,:tag,:start_time,:finish_time,:list_id)
  end
end
