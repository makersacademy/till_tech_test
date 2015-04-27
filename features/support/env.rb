ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/till_app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = TillApp

class TillAppWorld

  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

end

World do

  TillAppWorld.new

end
