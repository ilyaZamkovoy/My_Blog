class Api::V1::SessionsController < Devise::SessionsController
   wrap_parameters :user

  def create
    user = AuthenticateUser.call(warden: warden).user
    respond_with(user, serializer: SessionSerializer)
  end
end