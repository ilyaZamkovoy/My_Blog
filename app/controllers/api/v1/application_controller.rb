class Api::V1::ApplicationController < ActionController::Base
  include Pundit

  respond_to :json

  before_action :set_current_user!

  # do i need this?
  def set_current_user!
    @current_user = User.find_by auth_token: request.headers["X-Token"]
    unless @current_user
      render json: { error: "User not found" }.to_json and return
    end
  end
end
