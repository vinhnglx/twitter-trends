source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.4'

gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'pg' # PostgreSQL
gem 'twitter' # Twitter

gem 'google-analytics-rails' # Google Analytics
gem 'mixpanel-ruby' # Tracking Events
gem 'dotenv-rails' # Environment variables

gem 'nprogress-rails'
gem 'leaflet-rails'
gem 'chartkick'
gem 'groupdate'
gem 'active_median'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'omniauth', '~> 1.2.2' # Flexibale authentication
gem 'omniauth-twitter', '~> 1.2.1' # Omniauth strategy for Twitter

gem 'unicorn' # Server

group :development, :test do
  gem 'byebug' # Call `byebug` in code to stop excution and get a debugger console.
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'rspec-rails', '~> 3.2'
  gem 'selenium-webdriver' # used by JavaScript-dependent feature specs (`js: true`)
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'awesome_print'
  gem 'ffaker'
  gem 'web-console', '~> 2.0' # Access IRB on error pages or by <%= console %> in views
end

group :test do
  gem 'database_cleaner'
  gem 'poltergeist' # helps with using PhantomJS headless browser in feature specs
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  gem 'shoulda-matchers', '3.0.0.rc1'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
end
