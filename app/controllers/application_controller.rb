class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :cnil

  add_flash_types :danger, :success

  I18n.locale = :en

  def cnil
    if params[:data] == "oui"
      cookies[:cnil] = {
          value: "oui",
          expires: 1.month.from_now
      }

      flash.now[:success] = t(:cnil_success_message)
    elsif params[:data] == "non"
      redirect_to "https://www.cnil.fr/fr/cookies-traceurs-que-dit-la-loi"
    end
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:pseudo, :email, :password, :password_confirmation) }
  end
end