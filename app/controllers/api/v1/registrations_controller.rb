class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: %i(create)
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save!
      status = 200
      message = "Successfully created new account for email #{sign_up_params[:email]}."
    else
      clean_up_passwords resource
      status = 500
      message = "Failed to create new account for email #{sign_up_params[:email]}."
    end

    render json: { message: message }.to_json, status: status
  end

  # do i need this method
  def destroy
    set_current_user!
    if @current_user.destroy
      render json: { message: "Successfully deleted the account." }.to_json
    else
      render status: 400
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :full_name)
  end

  def set_current_user!
    @current_user = User.find_by auth_token: request.headers["X-Token"]
    unless @current_user
      render json: { error: "User not found" }.to_json and return
    end
  end
end
