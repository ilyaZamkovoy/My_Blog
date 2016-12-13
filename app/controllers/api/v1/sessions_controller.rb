class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i(create)
  respond_to :json

  # do i need session in api?
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    if @user.valid_password?(params[:password])
      respond_with @user
    else
      render nothing: true, status: :not_found
    end
  end
end
