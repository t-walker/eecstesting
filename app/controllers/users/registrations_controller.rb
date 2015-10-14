class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  skip_load_and_authorize_resource

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:firstname, :lastname, :studentid, :role)
  end
end
