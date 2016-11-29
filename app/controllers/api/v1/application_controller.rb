class ApplicationController < ActionController::API
  before_action :check_token

  def check_token
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(auth_token: token)
    end
  end
end
