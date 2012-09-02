class Webpage < ActiveRecord::Base
  attr_accessible :slug, :url

  validates :slug, :url, :presence => true
end
