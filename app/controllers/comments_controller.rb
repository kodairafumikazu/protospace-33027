class CommentsController < ApplicationController
  #before_action :set_prototype, only: [:edit, :show]

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  # def show
  #   @comments = Comment.create(comment_params)
  # end


end
