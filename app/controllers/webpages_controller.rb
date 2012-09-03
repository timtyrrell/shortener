class WebpagesController < ApplicationController
  def new
    @webpage = Webpage.new
  end

  def create
    webpage = Webpage.new(params[:webpage])
    webpage.generate_slug!

    if webpage.save
      results = {:notice => "Redirect created: #{request.host_with_port}/#{webpage.slug}"}
    else
      results = {:alert => "Redirect creation failed!"}
    end

    redirect_to new_webpage_path, results
  end

  def show
    webpage = Webpage.find_by_slug(params[:slug])
    if webpage
      redirect_to webpage.formatted_url
    else
      redirect_to new_webpage_path, :alert => "Redirect not found!"
    end
  end
end
