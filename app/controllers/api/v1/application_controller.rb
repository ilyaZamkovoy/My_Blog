class Api::V1::ApplicationController < ActionController::API
  respond_to :json

  before_action :set_current_user!

  # do i need this?
  def set_current_user!
    @current_user = User.find_by auth_token: request.headers["X-Token"]
    if @current_user
      sign_in(@current_user)
    else
      render json: { error: "User not found" }.to_json
    end
  end
end
