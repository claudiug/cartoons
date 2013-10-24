class Admin::CharactersController < ApplicationController
  layout "admin"
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
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



  private

  def set_character
    @character = Character.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Character not found"
    redirect_to admin_characters_path
  end

  def character_params
    params.require(:character).permit(:name, :description, :role, :first_appearance, :occupation, :spouse,
                                      :religion, :children, :cartoon_id)
  end
end
