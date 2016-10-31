class SubscriptionController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:id])
    @subscription = current_user.subscriptions.create(blogger: @user.id)
    redirect_to user_path(@user)
  end

  def destroy
    subscription.destroy
    respond_with(subscription)
  end

  def show
  end

  def subscription_params
    params.require(:subscription).permit(:blogger)
  end
end
