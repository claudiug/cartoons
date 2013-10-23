class Admin::CartoonsController < ApplicationController

  layout "admin"
  before_action :set_cartoon, only: [:show, :edit, :update, :destroy]


  def index
    @cartoons = Cartoon.all
  end

  def new
    @cartoon = Cartoon.new
  end

  def create
    @cartoon = Cartoon.new(cartoon_params)
    if @cartoon.save
      redirect_to [:admin, @cartoon], notice: "cartoon was created!"
    else
      render :new
      flash[:warning] ="please fix the errors"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cartoon.update(cartoon_params)
      redirect_to [:admin, @cartoon], notice: "cartoon was updated!"
    else
      render :edit
      flash[:warning]= "please fix the errors"
    end
    
  end

  def destroy
    @cartoon.destroy
    redirect_to admin_cartoons_path
    flash[:notice] = "cartoon destroy"
  end

  private

  def set_cartoon
    @cartoon = Cartoon.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Cartoon not found"
    redirect_to admin_cartoons_path
  end

  def cartoon_params
    params.require(:cartoon).permit(:title, :genre, :description, :created_by, :language, :country_of_origin,
                                    :no_of_episodes, :is_active)
  end

end
