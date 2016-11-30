class Api::V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: %i(create)
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    build_resource
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in(@user)
      respond_with @user
      return
    end
    invalid_login_attempt
  end

  def destroy
    sign_out(current_user)
    render status: 204
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    render json: {:success=>false, :message=>"Error with your email or password"}, status: 401
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end
  def valid_password?(password)
    Devise::Encryptor.compare(self.class, encrypted_password, password)
  end
end
