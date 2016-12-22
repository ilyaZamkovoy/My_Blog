module Api
  module V1
    class ApplicationController < ActionController::Base
      #include Pundit
      #include Api::V1::Concerns::Authorization

      respond_to :json

      before_action :set_current_user!

      def set_current_user!
        @current_user = User.find_by auth_token: request.headers["X-Token"]
        unless @current_user
          render status: 404
        end
      end
    end
  end
end
