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

  def show # Showing choosing user, and check if current_user follows him
    @user = User.find(params[:id])
    @user_posts = @user.posts
    subs = current_user.subscriptions
    @check = false
    subs.each do |s|
      @check = true if s.blogger == @user.id
    end
  end

  def index # Showing all user, except current user
    @final_arr = []
    users = User.where.not(id: current_user.id)
    users.each do |u|
      user_posts = u.posts
      user_posts.each { |p| @final_arr.push(p) } unless user_posts.nil?
    end
    @final_arr.sort_by(&:created_at)
  end
end
