require 'spec_helper'

describe Webpage do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:slug) }
end
