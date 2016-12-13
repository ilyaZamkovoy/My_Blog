class Api::V1::PostsController < Api::V1::ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @current_user.posts.create(post_params)
    respond_with @post
  end

  def index
    @posts = @current_user.posts
    respond_with @posts
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      respond_with @post
    else
      render json: { message: "its not your post" }.to_json
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      render json: { message: "post successfully deleted" }.to_json
    else
      render json: { message: "its not your post" }.to_json
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
