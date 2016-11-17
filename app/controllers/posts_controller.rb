class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated :post

  def create
    post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def index # Showing current_users posts
    @posts = current_user.posts.page(params[:posts_page]).per(10)
  end

  def update
    post.update_attributes(post_params)
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
