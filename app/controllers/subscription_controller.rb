class SubscriptionController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:id])
    @subscription = current_user.subscriptions.create(blogger: @user.id)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    subs = current_user.subscriptions
    subs.each do |s|
      s.destroy if s.blogger == @user.id
    end
    redirect_to user_path(@user)
  end

  def show
  end

  def index
    subs = current_user.subscriptions
    users = User.where.not(id: current_user.id)
    final_arr = []
    subs.each do |s|
      users.each do |u|
        if s.blogger == u.id
          u.posts.each do |post|
            final_arr.push(post)
          end
        end
      end
    end
    @sorted = final_arr.sort_by &:created_at
  end
end
