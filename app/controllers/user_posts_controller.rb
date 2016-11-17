class UserPostsController < ApplicationController
  before_action :authenticate_user!
  expose_decorated :user
  expose_decorated :post

  def index
    @posts = user.posts.order(created_at: :desc).page(params[:user_posts_page]).per(10)
  end

  def show
    @comments = post.comments.includes(:user)
  end
end
