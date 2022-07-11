class TasksController < ApplicationController
  def index
   @list = List.find(params[:id])
   @tasks = @list.tasks
   @task = Task.new
  end

  def new
   @task = Task.new
   @list = current_user.lists
  end
  
  def create
   @task = Task.new(task_params)
   @task.save
   redirect_to index_tasks_path(@task.list_id)
  end

  def edit
   @task = Task.find(params[:id])
  end
  
  def update
   @task = Task.find(params[:id])
   @task.update(task_params)
   redirect_to index_tasks_path(@task.list_id)
  end
  
  def destroy
   @task = Task.find(params[:id])
   @task.destroy
   redirect_to index_tasks_path(@task.list_id)
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
