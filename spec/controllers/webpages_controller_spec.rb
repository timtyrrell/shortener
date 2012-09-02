require 'spec_helper'

describe WebpagesController do

  describe "POST 'create'" do
    it "creates a webpage" do
      Webpage.any_instance.should_receive(:save)
      post 'create', :webpage => {:url => "www.google.com"}
    end

    it "returns the generated slug in a flash when successful" do
      Webpage.any_instance.stub(:save).and_return(true)
      post 'create', :webpage => {:url => "www.google.com"}
      flash[:notice].should start_with "Redirect created"
    end

    it "returns an error flash when unsuccessful" do
      Webpage.any_instance.stub(:save).and_return(false)
      post 'create', :webpage => {:url => "www.google.com"}
      flash[:alert].should == "Redirect creation failed!"
    end
  end

  describe "GET 'show'" do
    it "should redirect to the url from a slug" do
      webpage = Webpage.new(:url => "www.google.com", :slug => "placeholder")
      Webpage.stub(:find_by_slug).with(webpage.slug).and_return(webpage)
      get 'show', :slug => webpage.slug
      should redirect_to(webpage.url)
    end

    it "should redirect to the entry page if the slug is not found" do
      Webpage.stub(:find_by_slug).and_return(nil)
      get 'show', :slug => "bad"
      should redirect_to(new_webpage_path)
    end

    it "should display warning if the slug is not found" do
      Webpage.stub(:find_by_slug).and_return(nil)
      get 'show', :slug => "bad"
      flash[:alert].should == "Redirect not found!"
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
