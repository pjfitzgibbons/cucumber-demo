# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "selenium"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
#require 'cucumber/rails/world'
#require 'cucumber/formatters/unicode' # Comment out this line if you don't want Cucumber Unicode support
#Cucumber::Rails.use_transactional_fixtures
require 'cucumber/rails/world'
require 'cucumber/formatters/unicode'
#require 'webrat/rails'
require 'cucumber/rails/rspec'

require 'webrat'
require 'webrat/selenium'

Webrat.configure do |config|
  config.mode = :selenium
end

# Comment out the next two lines if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'webrat/core/matchers'
