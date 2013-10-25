class Admin::QuotesController < ApplicationController
  layout "admin"
  before_action :set_quotes, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column



  def index
    @quotes = Quote.order(sort_column + ' ' + sort_direction).
        paginate(page: params[:page], per_page: 5)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)
    if @quote.save
      redirect_to [:admin, @quote], notice: "quote was created!"
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
    if @quote.update(quotes_params)
      redirect_to [:admin, @quote], notice: "quote was updated!"
    else
      render :edit
      flash[:warning]= "please fix the errors"
    end

  end

  def destroy
    @quote.destroy
    redirect_to admin_quotes_path
    flash[:notice] = "Quote destroy"
  end


  private

  def set_quotes
    @quote = Quote.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Quote not found"
    redirect_to admin_quotes_path
  end

  def quotes_params
    params.require(:quote).permit(:content, :character_id)
  end

  def sort_column
    #Painting.column_names
    #columns = %w['name is_feature is_active image']
    if Cartoon.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "content"
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
