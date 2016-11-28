class Api::V1::UsersController < ApplicationController
  respond_to :json
  before_filter :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    respond_with @users
  end

  def show
    respond_with @user
  end

  def create
    @user = User.create(user_params)
    respond_with @user, location: url_for([:api, :v1, @user])
  end

  def update
    @user.update_attributes(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :full_name)
  end

end
