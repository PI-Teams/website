# config/initializers/locale.rb
 
# Where the I18n library should search for translation files
I18n.config.enforce_available_locales = true
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
 
# Set default locale to something other than :en
I18n.default_locale = :de

I18n.available_locales = %w(de)