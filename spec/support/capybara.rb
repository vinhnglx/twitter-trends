require 'capybara/rails'
require 'capybara/rspec'

# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# Only if you're not using Puffing Billy, to use Chrome instead of Firefox,
# uncomment the following 3 lines:
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
