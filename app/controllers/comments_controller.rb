class CommentsController < ApplicationController
  respond_to :html

  expose :comment
  expose :comments, -> { Comment.page(params[:page]) }

  def new
  end

  def show
    redirect_to comment.post
  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to @comment.post
  end

  def update
    comment.update_attributes(comment_params)
    respond_with(comment)
  end

  def destroy
    comment.destroy
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
