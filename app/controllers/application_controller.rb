class ApplicationController < ActionController::Base
  #include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :cnil
  before_action :lang


  add_flash_types :danger, :success

  def lang
    if cookies[:lang].blank?
      cookies[:lang] = {
          value: 'fr',
          expires: 1.month.from_now
      }
    end

    if !cookies[:lang].nil?
      if cookies[:lang] == 'fr'
        I18n.locale = :fr
      else
        I18n.locale = :en
      end
    else
      I18n.locale = :fr
    end
  end

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

  def changelang
    cookies[:lang] = {
        value: params[:id],
        expires: 1.month.from_now
    }
    redirect_to blog_path
  end

  private

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      elsif resource_or_scope == :user
        new_admin_session_path
      else
        root_path
      end
    end
end