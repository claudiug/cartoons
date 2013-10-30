class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by!(slug: params[:id])
    @commentable = @character
    @comments = @commentable.comments
    @comment =  Comment.new
  end

  private


end
