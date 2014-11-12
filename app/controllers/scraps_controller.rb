class ScrapsController < ApplicationController

  def index
    @scraps = Scrap.all
  end

  def create
    @scrap = Scrap.new(scrap_params)
    @scrap.image = scrap_params[:image]

    if @scrap.save
      redirect_to scraps_path
    else
      # And show an error!
      redirect_to scraps_path
    end
  end

  private


  def scrap_params
    params.require(:scrap).permit(:image)
  end
end
