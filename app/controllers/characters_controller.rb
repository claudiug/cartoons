class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by!(slug: params[:id])
  end

  private


end
