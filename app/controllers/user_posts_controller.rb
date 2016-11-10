class UserPostsController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end
end
