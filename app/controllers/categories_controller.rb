class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create
    Category.create(name: params[:category][:name])
    redirect_to categories_path, notice: "You created a category"
  end

  def destroy
    category = Category.find(params[:id])
    authorize! :destroy, category
    Category.destroy(params[:id])
    redirect_to categories_path, notice: "You deleted a category"
  end

end
