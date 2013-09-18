source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem "figaro"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem "factory_girl_rails"
end

group :test do
  gem "database_cleaner", '< 1.1.0'  
  gem "email_spec"
  gem "cucumber-rails", :require => false
  gem "capybara"
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'minitest', '4.2'
end
