class RecentPostsController < ApplicationController
  def index
    @posts = Post.limit(12).order(created_at: :desc).includes(:user).page(params[:recent_posts_page]).per(10)
    # render json: @posts, status: :ok
  end
end
