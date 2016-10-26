class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose :post

  def create
    @post = current_user.posts.create(post_params)

    respond_with(post)
  end

  def index
    @posts = current_user.posts
  end

  def all_users_posts
    @posts = Post.all
    @user_posts = current_user.posts
    @all_users = User.all
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
