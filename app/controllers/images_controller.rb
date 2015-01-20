class ImagesController < ApplicationController
  
  def index
    @images = Image.all
  end

  def create
    Image.create(name: params[:image][:name], url: params[:image][:url])
    redirect_to images_path, notice: "You created an image"
  end

end
