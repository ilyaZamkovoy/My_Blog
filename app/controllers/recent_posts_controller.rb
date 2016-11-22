class RecentPostsController < ApplicationController
  def index
    @posts = Post.latest.page(params[:recent_posts_page]).per(10)
  end
end
