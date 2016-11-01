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
    subscription = current_user.subscriptions
    @check = false
    subscription.each do |s|
      @check = true if s.blogger == @user.id
    end
  end

  def index
    @users = User.all.where("id != ?", current_user.id)
  end
end
