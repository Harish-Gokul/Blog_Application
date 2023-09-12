class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :require_user, except: [:show,:index]
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
    if @user.id != current_user.id
      flash[:alert] = "Your are restricted to edit others profile"
      redirect_to user_path(current_user)
    end
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
end