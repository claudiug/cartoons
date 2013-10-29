class CommentsController < ApplicationController
  before_action :load_comments



  def index
    @comments = @commentable.comments
  end

  def new

  end

  def show
    @comment = @commentable.new
  end

  private
  #def load_comments
  #  resource, id = request.path.split("/")[3, 4]
  #  @commentable = resource.singularize.classify.constantize.find_by_slug(id)
  #end

  def load_comments
    klass = [Cartoon, Character, Episode, Quote, Song].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find_by(slug: params["#{klass.name.underscore}_id"])
  end


end
