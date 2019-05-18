I18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/*.{rb,yml}"]

# Whitelist locales available for the application
I18n.available_locales = [:en, :ru]

# Set default locale to something other than :en
I18n.default_locale = :ru
