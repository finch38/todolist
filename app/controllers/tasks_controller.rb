class TasksController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

def create
  @list = List.find(params[:list_id])
  @task = @list.tasks.new(task_params)
  if @task.save
    flash[:success] = "Task created!"
    redirect_to current_user
  else
  	flash[:error] = "Could not create Task"
    render 'static_pages/home'
  end
end

private

  def task_params
    params.require(:task).permit(:content)
  end
end