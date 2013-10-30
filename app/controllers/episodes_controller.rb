class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find_by!(slug: params[:id])
    @commentable = @episode
    @comments = @commentable.comments
    @comment =  Comment.new
  end


end
