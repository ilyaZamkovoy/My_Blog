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
    subs = current_user.subscriptions
    @check = false
    subs.each do |s|
      @check = true if s.blogger == @user.id
    end
  end

  def index
    @users = User.where.not(id: current_user.id)
  end
end
