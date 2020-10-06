require 'securerandom'


class Shortener
  attr_reader :url, :link_model

  def initialize(url, link_model: Link)
    @url = url
    @link_model = link_model
  end

  def lookup_code
    loop do
      code = generate_code
      break code unless link_model.exists?(code)
    end
  end

  def generate_short_link
    link_model.new(original_url: url, lookup_code: lookup_code)
  end

  private 

  def generate_code
    SecureRandom.base64(12)[0..6]
  end

end
