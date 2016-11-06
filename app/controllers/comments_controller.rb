class CommentsController < ApplicationController
  respond_to :html

  expose :comment
  expose :comments, -> { Comment.page(params[:page]) }

  def create
    comment.save
    respond_with(comment)
  end

  def update
    comment.update_attributes(comment_params)
    respond_with(comment)
  end

  def destroy
    comment.destroy
    respond_with(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
