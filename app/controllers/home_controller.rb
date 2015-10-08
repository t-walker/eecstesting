class HomeController < ApplicationController
  skip_load_and_authorize_resource
  def index
    @user = current_user
  end
end
