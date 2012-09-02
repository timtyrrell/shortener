class WebpagesController < ApplicationController
  def new
  end

  def create
    webpage = Webpage.new(:url => params[:url])

    webpage.save
    redirect_to new_webpage_path
  end

  def show
  end
end
