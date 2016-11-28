class ApplicationController < ActionController::API

  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_filter :check_token

  protect_from_forgery with: :null_session



  def check_token
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(auth_token: token)
    end
  end
end
