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
  end

  def index
    @user_posts = current_user.posts
    @users = User.all
  end
end
