class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token, only: %i(create)

  def create
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      render json: user
    else
      render nothing: true, status: :not_found
    end
  end
end
