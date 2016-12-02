class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: %i(create)

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

  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)

    render json: { message: "Successfully deleted the account." }.to_json
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
