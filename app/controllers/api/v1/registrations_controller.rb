class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
    	sign_in(user)
      render :json=> user.as_json(:auth_token=>user.auth_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end