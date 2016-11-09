class SubscriptionController < ApplicationController
  def create # Creating a new subscription and redirect to choosing user page
    @user = User.find(params[:user_id])
    @subscription = current_user.subscriptions.create(blogger: @user.id)
    redirect_to user_page_path(@user)
  end

  def destroy # Destroying subscription and redirect to choosing user page
    sub = Subscription.find(params[:id])
    @user = User.find(sub.blogger)
    sub.destroy
    redirect_to user_page_path(@user)
  end

  def index # Showing feed with all current_user subscriprions
    @final_arr = []
    current_user.subscriptions.each do |s|
      posts = Post.all.includes(:user)
       posts.each do |p|
        @final_arr.push(p) if s.blogger == p.user.id
      end
    end
  end
end
