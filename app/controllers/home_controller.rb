class HomeController < ApplicationController

  def index
    @title = "Грузчики в Москве"
    @thumbnails = Thumbnail.all
  end

end
