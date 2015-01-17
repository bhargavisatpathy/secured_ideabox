class IdeasController < ApplicationController
  def new
  end

  def create
    Idea.create(title: params[:idea][:title], description: params[:idea][:description], user: current_user)
    redirect_to user_path(current_user), notice: "You created a new idea"
  end

end
