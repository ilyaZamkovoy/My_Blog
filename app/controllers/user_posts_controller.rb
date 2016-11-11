class UserPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).page(params[:user_posts_page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end
end
