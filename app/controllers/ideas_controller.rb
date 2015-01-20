class IdeasController < ApplicationController

  def new
  end

  def create
    category = Category.find(params[:idea][:category_id])
    idea = Idea.create(title: params[:idea][:title], description: params[:idea][:description], user: current_user, category: category)
    Image.all.each do |image|
      if params[:idea]["i_#{image.id}"] == "1"
        idea.images << image
      end
    end
    redirect_to user_path(current_user), notice: "You created a new idea"
  end

  def destroy
    idea = Idea.find(params[:id])
    authorize! :destroy, idea
    Idea.destroy(params[:id])
    redirect_to user_path(current_user), notice: "You deleted an idea"
  end

end
