class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat(%i(username first_name last_name title phone email biography avatar broker_logo))
  end
end
