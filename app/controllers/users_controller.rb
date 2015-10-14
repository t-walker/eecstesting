class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def make_admin
    user = User.find params[:id]
    user.update( :role => "admin" )
    redirect_to users_url
  end

  def make_admin
    user = User.find params[:id]
    user.update( :role => "student" )
    redirect_to users_url
  end
end
