require 'spec_helper'

describe WebpagesController do

  describe "POST 'create'" do
    it "creates a webpage" do
      Webpage.any_instance.should_receive(:save)
      post 'create', :url => "www.google.com"
    end

    it "returns the generated slug in a flash"
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
