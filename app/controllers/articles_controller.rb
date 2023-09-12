class ArticlesController < ApplicationController
  before_action :get_article, only: [:show,:update,:edit,:destroy]
  before_action :require_user, except: [:show,:index]
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
    if @article.user.id != current_user.id
      flash[:alert] = "Sorry you cannot edit others article"
      redirect_to user_path(current_user)
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice]  = "Article has been edited successfully"
      redirect_to article_path
    else
      render "edit"
    end
  end

  def destroy
     @article.destroy
     redirect_to articles_path
  end

  private
  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end
  
  def require_user
    if !logged_in?
      flash[:alert] = "You haven't logged in please login to perform the action"
      redirect_to login_path
    end
  end
end