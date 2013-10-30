class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find_by(slug: params[:id])
    @commentable = @quote
    @comments = @commentable.comments
    @comment =  Comment.new
  end
end
