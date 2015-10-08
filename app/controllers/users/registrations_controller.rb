class Users::RegistrationsController < Devise::RegistrationsController
  skip_load_and_authorize_resource
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:firstname, :lastname, :studentid)
  end
end
