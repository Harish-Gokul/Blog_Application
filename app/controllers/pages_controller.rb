class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    redirect_to articles_path if logged_in?
  end
  def about

  end
end
