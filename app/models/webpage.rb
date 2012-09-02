class Webpage < ActiveRecord::Base
  attr_accessible :slug, :url

  validates :slug, :url, :presence => true

  # callbacks are the devil, so this is not a before_save
  def generate_slug!
    self.slug = "placeholder"
  end
end
