class EpisodesController < ApplicationController
  before_action :set_cartoon

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find_by!(slug: params[:id])
  end

  private
  def set_cartoon
    @cartoon = Cartoon.find_by!(slug: params[:cartoon_id])
  end
end
