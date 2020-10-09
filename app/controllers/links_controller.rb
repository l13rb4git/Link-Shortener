class LinksController < ApplicationController

  def create    
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.generate_short_link
    
    respond_to do |format|
      if @link.save
        format.js
        format.html { redirect_to format.js }
      else
        format.js { render 'error.js.erb' }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
