class CharactersController < ApplicationController
  before_action :set_cartoon

  def index
    @characters = @cartoon.characters

  end

  def show
    @character = Character.find_by!(slug: params[:id])
    @commentable = @character
    @comments = @commentable.comments
    @comment =  Comment.new
  end

  private
  def set_cartoon
    @cartoon = Cartoon.find_by(slug: params[:cartoon_id])
  end

end
