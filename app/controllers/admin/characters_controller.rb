class Admin::CharactersController < ApplicationController
  layout "admin"
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column


  def index
    @characters = Character.order(sort_column + ' ' + sort_direction).
        paginate(page: params[:page], per_page: 5)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to [:admin, @character], notice: "character was created!"
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
    if @character.update(character_params)
      redirect_to [:admin, @character], notice: "character was updated!"
    else
      render :edit
      flash[:warning]= "please fix the errors"
    end

  end

  def destroy
    @character.destroy
    redirect_to admin_characters_path
    flash[:notice] = "character destroy"
  end

  def characters_terms
    @eps = Character.order(:name).where("name like ?", "#{params[:q]}%")
    render json: @eps.map(&:name), root: false
  end


  private

  def set_character
    @character = Character.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Character not found"
    redirect_to admin_characters_path
  end

  def character_params
    params.require(:character).permit(:name, :description, :role, :first_appearance, :occupation, :spouse,
                                      :religion, :children, :cartoon_id, :cartoon_title)
  end

  def sort_column
    #Painting.column_names
    #columns = %w['name is_feature is_active image']
    if Character.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "name"
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
