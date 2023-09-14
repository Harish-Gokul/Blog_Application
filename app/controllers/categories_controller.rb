class CategoriesController < ApplicationController

  before_action :allowOnlyAdmin, except: [:show,:index]
  def index
    @categories = Category.paginate(page: params[:page],per_page: 5)
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      flash[:notice] ="saved successfully"
      redirect_to category_path(@category)
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  def show
    @category = Category.find(params[:id])
  end
  
  def allowOnlyAdmin
    if !loggedInAsAdmin?
      flash[:alert] = "You are not allow to that page"
      redirect_to categories_path
    end
  end
end