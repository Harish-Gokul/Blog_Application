class ArticlesController < ApplicationController
  before_action :get_article, only: [:show,:update,:edit,:destroy]
  before_action :require_user, except: [:show,:index]
  before_action :require_same_user, only: [:edit,:update,:destroy]
  def show
  end

  def index
    @articles = Article.paginate(page: params[:page],per_page: 5)
  end

    def new
    @article = Article.new
    end
  def create
    @user = current_user
    @article = @user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to "/articles/#{@article.id}"
    else
      render "new"
    end
  end

  def edit

  end

  def update
    byebug
    if @article.update(article_params)
      flash[:notice]  = "Article has been edited successfully"
      redirect_to article_path
    else
      render "edit"
    end
  end

  def destroy
     @article.destroy
     flash[:notice] = "Deleted an article"
     redirect_to articles_path
  end

  private
  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description,:category_ids => [])
  end

  def require_same_user
    if (@article.user.id != current_user.id)&& !current_user.admin?
      flash[:alert] = "Sorry you cannot edit others article"
      redirect_to user_path(current_user)
    end
  end

  
  def require_user
    if !logged_in?
      flash[:alert] = "You haven't logged in please login to perform the action"
      redirect_to login_path
    end
  end

end

