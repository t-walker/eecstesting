class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\'users.csv'"
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def make_admin
    user = User.find params[:id]
    user.update( :role => "admin" )
    redirect_to users_url
  end

  def remove_admin
    user = User.find params[:id]
    user.update( :role => "student" )
    redirect_to users_url
  end
end
