class WebpagesController < ApplicationController
  def new
    @webpage = Webpage.new
  end

  def create
    webpage = Webpage.new(params[:webpage])
    webpage.generate_slug!

    if webpage.save
      results = {:notice => "Redirect created: http://localhost/#{webpage.slug}"}
    else
      results = {:alert => "Redirect creation failed!"}
    end

    redirect_to new_webpage_path, results
  end

  def show
  end
end
