class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new

  end
  def  create
    @user = User.find_by(params.require(:session).permit(:email))

    if @user && @user.authenticate(params.require(:session).permit(:password)[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Your credential was not right"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "successfully logged out"
    redirect_to root_path
  end

end