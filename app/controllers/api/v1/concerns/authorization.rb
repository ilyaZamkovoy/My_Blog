module Api::V1::Concerns::Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    render json: { message: "your are not authorized" }.to_json, status: 401
  end
end
