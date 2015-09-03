source "https://rubygems.org"

ruby "2.2.3"

gem "rails", "~> 4.2.4"

gem "backbone-on-rails", "~> 1.1.1.0"
gem "bootstrap-sass", "~> 3.1.1"
gem "coffee-rails", "~> 4.0.0"
gem "devise", "~> 3.5.2"
gem "font-awesome-rails", "~> 4.0.3.2"
gem "haml", "~> 4.0.5"
gem "haml-rails", "~> 0.5.3"
gem "hogan_assets", "~> 1.6.0"
gem "jbuilder", "~> 2.0"
gem "jquery-rails", "~> 3.1.0"
gem "omniauth", "~> 1.2.1"
gem "omniauth-google-oauth2", "~> 0.2.4"
gem "pg", "0.17.1"
gem "puma", "~> 2.13.4"
gem "rack-timeout", "~> 0.2.4"
gem "sass-rails", "~> 4.0.3"
gem "sdoc", "~> 0.4.0", group: :doc
gem "uglifier", ">= 1.3.0"

group :development do
  gem "spring", "~> 1.1.2"
  gem "web-console", "~> 2.0"
end

group :test do
  gem "capybara", "~> 2.5.0"
  gem "database_cleaner", "~> 1.2.0"
  gem "rspec-rails", "~> 3.3"
  gem "selenium-webdriver", "~> 2.47"
  gem "rake"

  # require this in spec_helper instead, to prevent warnings issue: https://github.com/rspec/rspec-rails/pull/772
  gem "shoulda-matchers", "~> 2.5", require: false
end

group :development, :test do
  gem "awesome_print", "~> 1.2.0"
  gem "factory_girl_rails", "~> 4.4.1"
  gem "faker", "~> 1.3.0"
  gem "pry-rails", "~> 0.3.4"
  gem "pry-byebug", "~> 3.1.0"
  gem "pry-doc", "~> 0.8.0"
  gem "dotenv-rails", "~> 0.11.1"
end

group :production do
  gem "rails_12factor", "~> 0.0.3"
end
