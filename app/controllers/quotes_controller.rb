class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find_by!(slug: params[:id])
  end
end
