class Api::V1::ApplicationController < ActionController::Base
  include Pundit
  include Api::V1::Concerns::Authorization

  respond_to :json

  before_action :set_current_user!

  def set_current_user!
    @current_user = User.find_by auth_token: request.headers["X-Token"]
    unless @current_user
      render json: { error: "User not found" }.to_json and return
    end
  end
end
