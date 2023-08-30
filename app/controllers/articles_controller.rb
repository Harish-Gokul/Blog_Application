class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

    def new
    @article = Article.new
    end
  def create
    @article = Article.new(params.require(:article).permit(:title,:description))
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to "/articles/#{@article.id}"
    else
      render "new"
    end
  end

  def edit
  @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article = Article.update(params.require(:article).permit(:title,:description))
    if @article.save
      flash[:notice]  = "Article has been edited successfully"
      redirect_to article_path
    else
      render "edit"
    end
  end

  def delete

  end

end