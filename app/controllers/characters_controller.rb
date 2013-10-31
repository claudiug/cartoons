class CharactersController < ApplicationController
  before_action :set_cartoon

  def index
    @characters = @cartoon.characters

  end

  def show
    @character = Character.find_by!(slug: params[:id])
  end

  private
  def set_cartoon
    @cartoon = Cartoon.find_by(slug: params[:cartoon_id])
  end

end
