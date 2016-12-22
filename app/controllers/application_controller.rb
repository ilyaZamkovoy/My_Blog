class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  private

  def after_sign_in_path_for(_)
    posts_path
  end

end
