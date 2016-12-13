class Api::V1::CommentsController < Api::V1::ApplicationController
  expose_decorated :comment

  def create
    comment = @current_user.comments.new(comment_params)
    if comment.save
      respond_with comment
    else
      render status: 422
    end
  end

  def update
    authorize comment
    if comment.update(comment_params)
      respond_with comment
    else
      respond_with status: 422
    end
  end

  def destroy
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
