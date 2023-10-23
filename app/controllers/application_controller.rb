class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :loggedInAsAdmin?
  before_action :authenticate_user!
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def authenticate_user!
    unless logged_in?
      flash[:alert] = "Sorry mame you do have to login in order to user that page"
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def loggedInAsAdmin?
    logged_in? && current_user.admin
  end

end
