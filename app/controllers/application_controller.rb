class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_certain_locales_from_accept_language_header || I18n.default_locale
  end

  def extract_certain_locales_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'][/(en|de)/]
  end
end
