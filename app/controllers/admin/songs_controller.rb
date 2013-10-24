class Admin::SongsController < ApplicationController
  layout "admin"
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)
    if @song.save
      redirect_to [:admin, @song], notice: "song was created!"
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
    if @song.update(songs_params)
      redirect_to [:admin, @song], notice: "song was updated!"
    else
      render :edit
      flash[:warning]= "please fix the errors"
    end

  end

  def destroy
    @song.destroy
    redirect_to admin_songs_path
    flash[:notice] = "song destroy"
  end


  private

  def set_song
    @episode = Song.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Episode not found"
    redirect_to admin_songs_path
  end

  def songs_params
    params.require(:song).permit(:title, :link, :episode_id)
  end
end
