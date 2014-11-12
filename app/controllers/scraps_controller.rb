class ScrapsController < ApplicationController

  def index
    @scraps = Scrap.all
  end

end
