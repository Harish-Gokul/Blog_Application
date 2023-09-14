class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :loggedInAsAdmin?
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def loggedInAsAdmin?
    logged_in? && current_user.admin
  end

end
