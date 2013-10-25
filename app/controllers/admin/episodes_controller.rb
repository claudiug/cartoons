class Admin::EpisodesController < ApplicationController
  layout "admin"
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column



  def index
    @episodes = Episode.order(sort_column + ' ' + sort_direction).
        paginate(page: params[:page], per_page: 5)

  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to [:admin, @episode], notice: "episode was created!"
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
    if @episode.update(episode_params)
      redirect_to [:admin, @episode], notice: "episode was updated!"
    else
      render :edit
      flash[:warning]= "please fix the errors"
    end

  end

  def destroy
    @episode.destroy
    redirect_to admin_episodes_path
    flash[:notice] = "cartoon destroy"
  end

  def sort_column
    #Painting.column_names
    #columns = %w['name is_feature is_active image']
    if Episode.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "name"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "asc"
    end
  end

  private

  def set_episode
    @episode = Episode.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Episode not found"
    redirect_to admin_episodes_path
  end

  def episode_params
    params.require(:episode).permit(:name, :episode_number, :season_number, :guest_actors, :plot, :background,
                                    :review, :cartoon_id, :cartoon_title)
  end




end
