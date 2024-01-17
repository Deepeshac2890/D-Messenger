class CategoriesController < ApplicationController
  def index

  end

  def new
    @category = Category.new
  end

  def show 

  end

  def create
    @category = Category.new(category_params)
    res = @category.save
    if res
      flash[:notice] = "Category was created."
      redirect_to @category
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end