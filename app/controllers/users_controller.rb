class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
    @lists = @user.lists.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @lists = @user.lists.paginate(page: params[:page])
    @lists.each do |f|
      f.tasks = f.tasks.paginate(page: params[:page])
    end
    if @lists.any?
      @list = List.new
      @task = @list.tasks.new
    else
      @list = List.new
    end
  end

  def new
  	@user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Todolist App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  #Before filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end