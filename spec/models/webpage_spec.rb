require 'spec_helper'

describe Webpage do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:slug) }

  describe "#url" do
    describe "when it does not begin with http" do
      it "should append http on the front if absent" do
        webpage = Webpage.new(:url => "www.google.com")
        webpage.formatted_url.should == "http://www.google.com"
      end
    end

    describe "when it begins with http" do
      it "should not modify it" do
        webpage = Webpage.new(:url => "http://www.google.com")
        webpage.formatted_url.should == "http://www.google.com"
      end
    end
  end
end
