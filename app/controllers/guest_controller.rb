class GuestController < ApplicationController
  expose_decorated :user

  def show
    user
  end
end
