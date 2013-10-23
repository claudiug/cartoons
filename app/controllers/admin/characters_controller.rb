class Admin::CharactersController < ApplicationController
  layout "admin"
  before_action :set_character, only: [:show, :edit, :update, :destroy]


  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def set_character
    @character = Character.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Character not found"
    redirect_to admin_characters_path
  end
end
