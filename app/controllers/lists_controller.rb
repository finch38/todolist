class ListsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@list = current_user.lists.build(list_params)
  	if @list.save
  	  flash[:success] = "List created!"
  	  redirect_to root_url
  	else
  	  render 'static_pages/home'
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