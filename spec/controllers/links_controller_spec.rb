require "rails_helper"


RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) {
    { :original_url => "https://www.website.com/videos/first-video.mp4" }
  }


  describe "POST #create" do
    context "with valid params" do
      it 'creates a new Link record' do
        request.env["HTTP_ACCEPT"] = "text/javascript"

        expect {
          post :create, params: { link: valid_attributes }
        }.to change(Link, :count).by(1)
      end

      it 'renders a js template' do
        request.env["HTTP_ACCEPT"] = "text/javascript"

        post :create, params: { link: valid_attributes }
        expect(response).to render_template('create')
      end
    end
  end
end
