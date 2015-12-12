require 'data_mapper'
require 'dm-validations'



env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/till_tech_#{env}")
require './app/models/database'


DataMapper.finalize

DataMapper.auto_upgrade!
