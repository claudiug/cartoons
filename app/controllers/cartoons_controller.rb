class CartoonsController < ApplicationController

  def index
    @search = Cartoon.search(params[:q])
    @cartoons = @search.result
  end

  def show
    @cartoon = Cartoon.find_by!(slug: params[:id])
  end



end
