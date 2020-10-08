require "rails_helper"


RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) {
    { :url => "https://www.website.com/videos/first-video.mp4" }
  }


  describe "POST #create" do
    context "with valid params" do
      it 'creates a new Link record' do
        expect {
          post :create, params: { link: valid_attributes }
        }.to change(Link, :count).by(1)
      end
    end
  end
end
