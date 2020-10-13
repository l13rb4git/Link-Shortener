require "rails_helper"


RSpec.describe "Link redirection", type: :request do
  it 'redirect to the original url from a given short link' do
    url = "http://www.google.com"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    link.save

    get link.shortened_url

    expect(response).to redirect_to(link.original_url)
  end
end
