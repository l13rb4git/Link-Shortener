require 'digest/sha2'


class Shortener
  attr_reader :url, :link_model

  def initialize(url, link_model: Link)
    @url = url
    @link_model = link_model
  end

  def lookup_code
    i = 0
    loop do
      code = generate_code(i)
      break code unless link_model.exists?(code)
      i += 1
    end
  end

  def generate_short_link
    link_model.new(original_url: url, lookup_code: lookup_code)
  end

  private 

  def generate_code i
    Digest::SHA256.hexdigest(url)[i..(i + 6)]
  end

end
