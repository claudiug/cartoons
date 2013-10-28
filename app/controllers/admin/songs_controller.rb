class Admin::SongsController < ApplicationController
  layout "admin"
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column



  def index
    @songs = Song.order(sort_column + ' ' + sort_direction).
        paginate(page: params[:page], per_page: 5)
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
    @song = Song.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Episode not found"
    redirect_to admin_songs_path
  end

  def songs_params
    params.require(:song).permit(:title, :link, :episode_id, :episode_name)
  end

  def sort_column
    #Painting.column_names
    #columns = %w['name is_feature is_active image']
    if Cartoon.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "title"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "asc"
    end
  end
end
