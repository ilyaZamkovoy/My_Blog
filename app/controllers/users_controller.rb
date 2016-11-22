class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated :user

  def show
    @check = false
    @sub = 1
    Subscription.all.each do |s|
      if s.user_id == current_user.id && s.blogger == user.id
        @check = true
        @sub = s.id
      end
    end
  end
end
