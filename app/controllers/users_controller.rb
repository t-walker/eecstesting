class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.order('users.role ASC').order('users.created_at').all
    @current = Time.now
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end

  def make_admin
    user = User.find params[:id]
    user.update( :role => 'admin' )
    redirect_to users_url
  end

  def remove_admin
    user = User.find params[:id]
    user.update( :role => 'student' )
    redirect_to users_url
  end

  def make_advisor
    user = User.find params[:id]
    user.update( :role => 'advisor' )
    redirect_to users_url
  end

  def remove_advisor
    user = User.find params[:id]
    user.update( :role => 'student' )
    redirect_to users_url
  end
end
