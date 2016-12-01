class Api::V1::PostsController < Api::V1::ApplicationController
  def show
    @post = Post.search(params.fetch(:qs, ""))
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
    @post.update_attributes(post_params)
    respond_with @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {error: "post successfully deleted"}.to_json
  end

  private

  def post_params
  	params.require(:post).permit(:title, :text)
  end
end
