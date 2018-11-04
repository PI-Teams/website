class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  include HttpAcceptLanguage::AutoLocale

  private

    def set_locale
      I18n.locale = params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
    end 
end