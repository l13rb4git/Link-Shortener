class LinksController < ApplicationController

  def create    
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.generate_short_link
    
    respond_to do |format|
      if @link.save
        format.js
        format.html do
          redirect_to format.js
        end
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
