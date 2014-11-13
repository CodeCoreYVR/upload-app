class ScrapsController < ApplicationController

  def index
    @scraps = Scrap.all
  end

  def create
    @scrap = Scrap.new(scrap_params)

    if scrap_params[:image].present?
      @scrap.image = scrap_params[:image]
    elsif scrap_params[:text_file].present?
      @scrap.text_file = scrap_params[:text_file]
    end

    @scrap.save

    respond_to do |format|
      format.html do
        redirect_to scraps_path
      end

      format.js
    end
  end

  private


  def scrap_params
    params.require(:scrap).permit(:image, :text_file)
  end
end
