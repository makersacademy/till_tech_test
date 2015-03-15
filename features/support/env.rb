
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './app/app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'airborne'

Airborne.configure do |config|
  config.base_url = 'http://localhost:9292'
end

Capybara.app = TillTechTest

class TillTechTestWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
  include Airborne
end

World do
  TillTechTestWorld.new
end
