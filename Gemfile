source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "bootsnap", require: false
gem 'bootstrap5-kaminari-views'
gem "cpf_cnpj"
gem "dotenv-rails"
gem "importmap-rails"
gem "jbuilder"
gem "kaminari"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'twilio-ruby'

# gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails"
  gem "faker"
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
  gem "web-console"
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end