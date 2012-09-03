class Webpage < ActiveRecord::Base
  attr_accessible :slug, :url

  validates :slug, :url, :presence => true

  # callbacks are the devil, so this is not a before_save
  def generate_slug!
    # encode to base 36. Not perfect, but decent for this example
    self.slug = Time.now.utc.to_i.to_s(36)
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
