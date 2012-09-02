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

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    pending "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
