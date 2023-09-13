class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update,:destroy]
  before_action :require_user, only: [:edit,:update]
  before_action :valid_user, only: [:edit,:update,:destroy]
  def index
    @users = User.paginate(page: params[:page],per_page: 5)
  end
  def show
    @articles = @user.articles.paginate(page: params[:page],per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit

  end

  def update
    @user.update(paramsValue)
    if @user.save
      flash[:notice] = "Successfully updated user details"
      redirect_to @user
    else
      render "edit"
    end

  end
  def create
    @user = User.new(paramsValue)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New Account Created"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    @user.destroy
    session[:user_id] =nil if @user == current_user
    flash[:alert] = "user have been deleted successfully"
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def paramsValue
    params.require(:user).permit(:username,:email,:password)
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Please log in to perform this action"
      redirect_to login_path
    end
  end

  def valid_user
    if (@user.id != current_user.id)&& !current_user.admin?
      flash[:alert] = "Your are restricted to edit others profile"
      redirect_to user_path(current_user)
    end
  end

end