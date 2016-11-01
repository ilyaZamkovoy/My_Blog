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
    users = User.all.where("id != ?", current_user.id)
    @finalArr = Array.new
    y = 0
    subs.each do |s|
      users.each do |u|
        if s.blogger = u.id
          @finalArr.insert(y,u)
          y+=1
        end
      end
    end
  end
end
