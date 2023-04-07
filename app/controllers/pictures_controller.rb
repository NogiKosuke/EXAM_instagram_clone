class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end
  
  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to new_picture_path
    else
      render :new
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:content,:picture)
  end
end
