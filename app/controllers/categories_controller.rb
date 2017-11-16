class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_back(fallback_location: "pages/categories")
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_back(fallback_location: "pages/categories")
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
