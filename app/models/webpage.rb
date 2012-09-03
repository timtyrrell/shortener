class Webpage < ActiveRecord::Base
  attr_accessible :slug, :url

  validates :url, :presence => true
  validates :slug, :uniqueness => true, :unless => "slug.blank?"

  after_create :generate_slug

  def generate_slug
    # encode to base 36
    update_attributes(:slug => self.id.to_s(36))
  end

  def formatted_url
    return url if url.blank?

    if url.match(/^http/)
      url
    else
      "http://#{url}"
    end
  end
end
