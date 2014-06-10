class TasksController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

def create
  @list = List.find(params[:list_id])
  @task = @list.tasks.build(task_params)
  if @task.save
    flash[:success] = "Task created!"
    redirect_to current_user
  else
  	flash[:error] = "Could not create Task"
    render 'static_pages/home'
  end
end

def new
  @list = current_user.lists.find_by(id: params[:id])
  @task = @list.tasks.new
end

private

  def task_params
    params.require(:task).permit(:content)
  end

  def correct_user
    @list = current_user.lists.find_by(id: params[:id])
    redirect_to root_url if @list.nil?
  end
end