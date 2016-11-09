class RecentPostsController < ApplicationController
  def index
    @posts = Post.limit(12).order(created_at: :desc).includes(:user)
  end
end
