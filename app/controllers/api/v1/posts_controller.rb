class Api::V1::PostsController < Api::V1::ApplicationController
  expose_decorated :post

  def show
    render json: post
  end

  def create
    post = @current_user.posts.new(post_params)
    if post.save
      render json: post
    else
      render status: 422
    end
  end

  def index
    posts = @current_user.posts
    render json: posts
  end

  def update
    authorize post
    if post.update_attributes(post_params)
      render json: @post
    else
      render status: 401
    end
  end

  def destroy
    authorize post
    if post.destroy
      render json: post
    else
      render status: 401
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
