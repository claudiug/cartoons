class Admin::EpisodesController < ApplicationController
  layout "admin"
  before_action :set_episode, only: [:show, :edit, :update, :destroy]


  def index
   @episodes = Episode.all
  end

  def new
   @episode = Episode.new
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

  def set_episode
    @episode = Episode.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Episode not found"
    redirect_to admin_episodes_path
  end


end
