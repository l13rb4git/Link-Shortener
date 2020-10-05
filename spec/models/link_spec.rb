require 'rails_helper'

RSpec.describe Link, type: :model do

  it 'is valid if it has an original URL and a lookup code' do
    link = Link.new(
      original_url: "https://www.website.com/videos/first-video.mp4",
      lookup_code: "1234567"
    )

    expect(link.valid?).to be(true)
  end

  it 'is invalid if it only has an original URL and not a lookup code' do
    link = Link.new(
      original_url: "https://www.website.com/videos/first-video.mp4",
    )

    expect(link.valid?).to be(false)
  end
end
