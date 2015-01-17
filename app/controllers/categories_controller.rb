class CategoriesController < ApplicationController
  def new
  end

  def create
    Category.create(name: params[:category][:name])
    redirect_to user_path(current_user), notice: "You created a category"
  end

end
