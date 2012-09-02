class WebpagesController < ApplicationController
  def new
  end

  def create
    webpage = Webpage.new(params[:webpage])

    if webpage.save
      results = {:notice => "Redirect created: http://localhost/#{webpage.slug}"}
    else
      results = {:error => "Redirect creation failed!"}
    end

    redirect_to new_webpage_path, results
  end

  def show
  end
end
