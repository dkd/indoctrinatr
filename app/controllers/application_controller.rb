class ApplicationController < ActionController::Base
  VALID_LOCALES_AS_REGEX = /(en|de)/
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_certrain_locals_from_params || extract_certain_locales_from_accept_language_header || I18n.default_locale
  end

  def extract_certrain_locals_from_params
    params.fetch(:locale, '')[VALID_LOCALES_AS_REGEX]
  end

  def extract_certain_locales_from_accept_language_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '')[VALID_LOCALES_AS_REGEX]
  end
end
