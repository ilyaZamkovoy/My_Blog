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
  end

  def subscription_params
    params.require(:subscription).permit(:blogger)
  end
end
