class EpisodesController < ApplicationController
  before_action :set_cartoon

  def index
    @episodes = @cartoon.episodes
  end

  def show
    @episode = Episode.find_by!(slug: params[:id])
    @commentable = @episode
    @comments = @commentable.comments
    @comment =  Comment.new
  end

  private
  def set_cartoon
    @cartoon = Cartoon.find_by(slug: params[:cartoon_id])
  end
end
