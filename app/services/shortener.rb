require 'digest/sha2'


class Shortener
  attr_reader :url, :link_model, :link_count

  def initialize(url, link_model: Link)
    @url = url
    @link_model = link_model
  end

  # TODO: Delete this method if it inst in use #
  #       by now, it is used only for testing 
  def lookup_code
    loop do
      code = generate_code
      break code unless link_model.exists?(code)
    end
  end

  def generate_short_link
    link_model.new(original_url: url, lookup_code: generate_code)
  end

  private 

  def generate_code
    Digest::SHA256.hexdigest(unique_id)[0..6]
  end

  def unique_id
    "#{link_count}#{url}"
  end

  def link_count
    link_model.count
  end

end
