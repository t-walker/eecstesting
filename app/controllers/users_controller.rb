class UsersController < ApplicationController
  load_and_authorize_resource

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
