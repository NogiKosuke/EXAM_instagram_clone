class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else @picture = Picture.new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
    if @picture.user_id != current_user.id
      redirect_to new_session_path
    end
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.user_id != current_user.id
      redirect_to new_session_path
    end

    if @picture.update(picture_params)
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user_id != current_user.id
      redirect_to new_session_path
    end
    @picture.destroy
    redirect_to pictures_path
  end

  def bookmarks
    @pictures = current_user.favorites
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :picture, :picture_cache)
  end
end
