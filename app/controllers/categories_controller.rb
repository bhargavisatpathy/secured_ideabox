class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.all
  end

  def create
    Category.create(name: params[:category][:name])
    redirect_to categories_path, notice: "You created a category"
  end

end
