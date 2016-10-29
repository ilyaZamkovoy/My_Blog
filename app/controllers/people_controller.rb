class PeopleController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def index
    @users = User.all.where("id != ?", current_user.id)
  end
end
