class Api::V1::SessionsController < Devise::SessionsController
  before_filter :authenticate_user!, only: %i(create)
  respond_to :json
  
  #do i need session in api?
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    if @user.valid_password?(params[:password])
      sign_in(@user)
      respond_with @user
    else
      render json: {error: "Password is incorrect"}.to_json
    end
  end

  #do i need this?
  def destroy
    if user_signed_in?
      sign_out(current_user)

      reswpond_to do |format|
        format.json {
          render json: {
            message: 'Logged out successfully.'
          }, status: HTTP_OK
        }
      end
    else
      respond_to do |format|
        format.json {
          render json: {
            message: 'Failed to log out. User must be logged in.'
          }
        }
      end
    end
  end
end
