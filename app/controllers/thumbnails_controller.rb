class ThumbnailsController < ApplicationController
  before_action :authenticate_user!
  add_breadcrumb "Главная", :root_path

  def index
    @thumbnails = Thumbnail.all
    add_breadcrumb 'Миниатюры', thumbnails_path
  end
  def show
    @thumbnail = Thumbnail.find(params[:id])
    @title = @thumbnail.title

    add_breadcrumb 'Миниатюры', thumbnails_path
    add_breadcrumb @thumbnail.title, thumbnail_path(@thumbnail)
  end
  def new
    @thumbnail = Thumbnail.new

    add_breadcrumb 'Миниатюры', thumbnails_path
    add_breadcrumb 'Новая миниатюра', new_thumbnail_path
  end
  def edit
    @thumbnail = Thumbnail.find(params[:id])

    add_breadcrumb 'Миниатюры', thumbnails_path
    add_breadcrumb "Редактирование", edit_thumbnail_path(@thumbnail)
  end
  def create
    @thumbnail = Thumbnail.new(thumbnail_params)

    if @thumbnail.save
      redirect_to @thumbnail
    else
      render 'new'
    end
  end
  def update
    @thumbnail = Thumbnail.find(params[:id])

    if @thumbnail.update(thumbnail_params)
      redirect_to @thumbnail
    else
      render 'edit'
    end
  end
  def destroy
    @thumbnail = Thumbnail.find(params[:id])
    @thumbnail.destroy

    redirect_to thumbnails_path
  end
  def ajax
    @thumbnails = Thumbnail.all
    respond_to do |format|
      format.json { render json: @thumbnails }
    end
  end
  private
    def thumbnail_params
      params.require(:thumbnail).permit(:title, :text, :image)
    end
end
