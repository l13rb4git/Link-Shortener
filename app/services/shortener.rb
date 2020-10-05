require 'digest/sha2'


class Shortener
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def lookup_code
    Digest::SHA256.hexdigest(url)[0..6]
  end

  def generate_short_link
    Link.new(original_url: url, lookup_code: lookup_code)
  end
end
