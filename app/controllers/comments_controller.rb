class CommentsController < ApplicationController
  respond_to :html

  expose :comment
  expose :comments, -> { Comment.page(params[:page]) }

  def create
    @comment = current_user.comments.create(comment_params)
    respond_with(comment)
    @post = Post.find(params[:id])
    redirect_to post_path(@post)
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
    post = Post.find(params[:id])
    params.require(:comment).permit(:text, post_id: post.id)
  end
end
