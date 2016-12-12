class Api::V1::CommentsController < Api::V1::ApplicationController
  def create
    comment = @current_user.comments.create(comment_params)
    if comment.save
      respond_with comment
    else
      render status: 422
    end
  end

  def update
    comment = Comment.find(params[:id])
    authorize comment
    if comment.update(comment_params)
      render json: { message: "comment susccesfully updated" }.to_json
      # respond_with comment
    else
      render status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    authorize comment
    if comment.destroy
      render json: { message: "comment susccesfully deleted" }.to_json
      # respond_with comment
    else
      render status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
