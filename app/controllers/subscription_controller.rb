class SubscriptionController < ApplicationController
  def create # Creating a new subscription and redirect to choosing user page
    @user = User.find(params[:id])
    @subscription = current_user.subscriptions.create(blogger: @user.id)
    redirect_to user_path(@user)
  end

  def destroy # Destroying subscription and redirect to choosing user page
    @user = User.find(params[:id])
    subs = current_user.subscriptions
    subs.each do |s|
      s.destroy if s.blogger == @user.id
    end
    redirect_to user_path(@user)
  end

  def show
  end

  def index # Showing feed with all current_user subscriprions
    @final_arr = []
    current_user.subscriptions.each do |s|
      User.where.not(id: current_user.id).each do |u|
        u.posts.each { |p| @final_arr.push(p) } if s.blogger == u.id
      end
    end
  end
end
