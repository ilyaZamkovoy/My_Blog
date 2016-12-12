class CommentsController < ApplicationController
  respond_to :html
  expose :comment
  expose_decorated :post

  def new
  end

  def show
    redirect_to comment.post
  end

  def create
    comment = current_user.comments.create(comment_params)
    if comment.save
      redirect_to post
    else
      respond_to do |format|
        format.html { redirect_to post, alert: "comment cant be empty" }
      end
    end
  end

  def update
    comment.update_attributes(comment_params)
    respond_with(comment)
  end

  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to comment.post, alert: "comment successfully deleted" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
