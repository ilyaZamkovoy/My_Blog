class Api::V1::PostsController < Api::V1::ApplicationController
  def show
    @post = Post.find(params[:id])
    respond_with @post
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

      render json: { message: "post susccesfully updated" }.to_json # why response is empty?
      # respond_with @post
    else
      render json: { message: "its not your post" }.to_json
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      respond_with @post
    else
      render json: { message: "its not your post" }.to_json
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
