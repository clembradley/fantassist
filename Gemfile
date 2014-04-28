source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'backbone-on-rails', '~> 1.1.1.0'
gem 'jquery-rails', '~> 3.1.0'
gem 'turbolinks', '~> 2.2.2'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'haml', '~> 4.0.5'
gem 'haml-rails', '~> 0.5.3'
gem 'hogan_assets', '~> 1.6.0'
gem 'awesome_print', '~> 1.2.0'

gem 'devise', '~> 3.2.4'
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-google-oauth2', '~> 0.2.4'

group :development do
  gem 'brakeman', '~> 2.4.3', require: false
  gem 'spring', '~> 1.1.2'
end

group :test do
  gem 'capybara', '~> 2.2.1'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'rspec-rails', '~> 2.14.2'
  gem 'selenium-webdriver', '~> 2.41.0'

  # require this in spec_helper instead, to prevent warnings issue: https://github.com/rspec/rspec-rails/pull/772
  gem 'shoulda-matchers', '~> 2.5.0', require: false
end

group :development, :test do
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'faker', '~> 1.3.0'
  gem 'fuubar', '~> 1.3.2'
  gem 'pry-rails', '~> 0.3.2'
  gem 'pry-plus', '~> 1.0.0'
  gem 'dotenv-rails'
end

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end
