class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: %i(create)
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      status = 200
    else
      clean_up_passwords resource
      status = 422
    end

    render status: status
  end

  # do i need this method
  def destroy
    @current_user.destroy
    render status: 410
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
