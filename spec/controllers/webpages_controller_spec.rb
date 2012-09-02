require 'spec_helper'

describe WebpagesController do

  describe "POST 'create'" do
    it "creates a webpage" do
      Webpage.any_instance.should_receive(:save)
      post 'create', :webpage => {:url => "www.google.com"}
    end

    pending "returns the generated slug in a flash when successful" do
      post 'create', :webpage => {:url => "www.google.com"}
      flash[:notice].should == "Redirect creation failed!"
    end

    pending "returns an error flash when unsuccessful" do
      post 'create', :webpage => {:url => "www.google.com"}
      flash[:error].should == "Redirect creation failed!"
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
