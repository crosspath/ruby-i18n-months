# frozen_string_literal: true

require 'i18n'

require_relative 'ruby-i18n-months/i18n-patch'
require_relative 'ruby-i18n-months/version'

if defined?(Rails)
  ActiveSupport::Reloader.to_prepare do
    I18n.load_path << File.expand_path('ruby-i18n-months/translations.yml', __dir__)
  end
else
  I18n.load_path << File.expand_path('ruby-i18n-months/translations.yml', __dir__)
end
