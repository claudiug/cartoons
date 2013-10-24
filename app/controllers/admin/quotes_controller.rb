class Admin::QuotesController < ApplicationController
  layout "admin"
  before_action :set_quotes, only: [:show, :edit, :update, :destroy]


  def index
    @quotes = Quote.all
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
    @quote = Quote.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Quote not found"
    redirect_to admin_quotes_path
  end

  def quotes_params
    params.require(:quote).permit(:content, :character_id)
  end


end
