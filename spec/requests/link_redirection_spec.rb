require "rails_helper"


RSpec.describe "Link redirection", type: :request do
  it 'redirect to the original url from a given short link' do
    url = "http://www.google.com"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    get link.shortened_url
  end
end
