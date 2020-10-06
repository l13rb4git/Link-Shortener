require "rails_helper"


RSpec.describe Shortener do
  it 'shortens a given URL to a 7 character lookup code' do
    url = "https://www.website.com/videos/first-video.mp4"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'give each URL its own lookup code' do
    url = "https://www.website.com/videos/first-video.mp4"
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = "https://www.website.com/videos/second-video.mp4"
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_1).not_to eq(code_2)
  end

  it 'generates a Link record with a unique lookup code' do
    url = "https://www.website.com/videos/first-video.mp4"
    shortener = Shortener.new(url)

    link = shortener.generate_short_link
    expect(link.valid?).to be(true)
    link.save

    link_2 = shortener.generate_short_link
    expect(link_2.valid?).to be(true)
  end
end
