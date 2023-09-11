class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(paramsValue)

    if @user.save
      flash[:notice] = "Successfully updated user details"
      redirect_to articles_path
    else
      render "edit"
    end

  end
  def create
    @user = User.new(paramsValue)

    if @user.save
      flash[:notice] = "New Account Created"
      redirect_to articles_path
    else
      render "new"
    end
  end

  private
  def paramsValue
    params.require(:user).permit(:username,:email,:password)
  end
end