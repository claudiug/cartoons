class CartoonsController < ApplicationController


  def index
     @cartoons = Cartoon.all
  end

  def show
    @cartoon = Cartoon.find_by!(slug: params[:id])
  end

end
