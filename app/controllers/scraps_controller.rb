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

    if @scrap.save
      redirect_to scraps_path
    else
      # And show an error!
      redirect_to scraps_path
    end
  end

  private


  def scrap_params
    params.require(:scrap).permit(:image, :text_file)
  end
end
