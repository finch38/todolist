class ListsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@list = current_user.lists.build(list_params)
  	if @list.save
  	  flash[:success] = "List created!"
  	  redirect_to current_user
  	else
  	  render 'static_pages/home'
  	end
  end

  def show
    @list = List.find(params[:user_id])
    @task = @list.tasks.new
  end

  def new
    @list = current_user.lists.new
    @task = @list.tasks.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List Updated!"
      redirect_to current_user
    else
      flash[:error] = "Could not update list"
      redirect_to list_edit_path
    end
  end

  def destroy
    @list.destroy
    redirect_to root_url
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end
    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end