class UserPageController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
    subs = Subscription.all
    @check = false
    @sub = 1
    subs.each do |s|
      if (s.user_id == current_user.id && s.blogger == @user.id)
      	@check = true
      	@sub = s.id
      end
    end
  end
end
