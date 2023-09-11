class ArticlesController < ApplicationController
  before_action :get_article, only: [:show,:update,:edit,:destroy]
  def show
  end

  def index
    @articles = Article.all
  end

    def new
    @article = Article.new
    end
  def create
    @user = User.find(12)
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
end