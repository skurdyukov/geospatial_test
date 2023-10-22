source "https://rubygems.org"

ruby "3.2.2"
gem "rails", "~> 7.1.0"
gem "sprockets-rails"

gem "puma", ">= 5.0"
gem "bootsnap", require: false

gem "turbo-rails"
gem "stimulus-rails"
gem "importmap-rails"
gem "jbuilder"

gem 'pg', '~> 1.5.4'

gem "tzinfo-data", platforms: %i[ windows jruby ]
gem 'hashie', '~> 5.0.0'
gem 'dry-validation', '~> 1.10.0'
gem 'blueprinter', '~> 0.30.0'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.0.3'
  gem 'pry-rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
