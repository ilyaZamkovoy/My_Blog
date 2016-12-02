class Api::V1::CommentsController < Api::V1::ApplicationController
  after_action :verify_authorized
  def create
    @comment = @current_user.comments.create(comment_params)
    if @comment.save
      respond_with @comment
    else
      render json: { error: "comment cant be empty" }.to_json
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      respond_with @comment
    else
      render json: { message: "its not your comment" }.to_json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.destroy
      render json: { message: "comment successfully deleted" }.to_json
    else
      render json: { message: "its not your comment" }.to_json
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
