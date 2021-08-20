# frozen_string_literal: true

require_relative 'lib/ruby-i18n-months/version'

Gem::Specification.new do |spec|
  spec.name    = 'ruby-i18n-months'
  spec.version = RubyI18nMonths::VERSION
  spec.authors = ['Evgeniy Nochevnov']

  spec.summary = <<~TEXT
    Format dates for that languages that use different words for months in formats like "23rd april of 2022" and "April 2022"'
  TEXT

  spec.description = <<~TEXT
    Format dates with added directives "%O" and "%o" for months without days. Some languages use different words for month names in formats like "23rd april of 2022" and "April 2022". These languages are Russian, Ukrainian, Greek and others.
  TEXT

  spec.homepage = 'https://github.com/crosspath/ruby-i18n-months'
  spec.license  = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features|\.github)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('i18n', '>= 0.8.0')
end
