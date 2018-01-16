class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_devise_parameters, if: :devise_controller?

  add_flash_types :danger, :success

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:pseudo, :email, :password, :password_confirmation) }
  end
end
