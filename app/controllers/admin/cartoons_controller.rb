class Admin::CartoonsController < ApplicationController

  layout "admin"
  before_action :set_cartoon, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column


  def index
    @cartoons = Cartoon.order(sort_column + ' ' + sort_direction).
        paginate(page: params[:page], per_page: 5)
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
    @cartoon = Cartoon.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Cartoon not found"
    redirect_to admin_cartoons_path
  end

  def cartoon_params
    params.require(:cartoon).permit(:title, :genre, :description, :created_by, :language, :country_of_origin,
                                    :no_of_episodes, :is_active, )
  end

  def sort_column
    #Painting.column_names
    #columns = %w['name is_feature is_active image']
    if Cartoon.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "title"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "asc"
    end
  end



end
