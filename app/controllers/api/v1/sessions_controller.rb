class Api::V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  skip_before_filter :verify_authenticity_token
  before_filter :ensure_params_exist

  respond_to :json

  def create
    build_resource
    @current_user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @current_user

    if @current_user.valid_password?(params[:password])
      sign_in("user", @current_user)
      render json: {success: true, auth_token: @current_user.auth_token, email: @current_user.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
    sign_out(@current_user_name)
    render json: {message: "sign_out susccessfull"}
  end

  protected
  def ensure_params_exist
    return unless params[:email].blank?
    render :json=>{:success=>false, :message=>"missing user_email parameter"}, status: 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your email or password"}, status: 401
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end
  def valid_password?(password)
    Devise::Encryptor.compare(self.class, encrypted_password, password)
  end
end