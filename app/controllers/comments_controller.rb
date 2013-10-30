class CommentsController < ApplicationController
  before_action :load_comments



  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    #send an email to me with some details!
    @comment = @commentable.comments.new(params.require(:comment).permit(:name, :email, :content,:commentable_id, :commentable_type ))
    if @comment.save
      CommentsMailer.comments_receive(@comment).deliver
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
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
