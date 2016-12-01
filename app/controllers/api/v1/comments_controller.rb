class Api::V1::CommentsController < Api::V1::ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      respond_with @comment
    else
      render json: { error: "comment cant be empty" }.to_json
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    respond_with @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { message: "comment successfully deleted" }.to_json
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
