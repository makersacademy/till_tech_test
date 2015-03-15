require 'sinatra/base'
require 'erb'
require "sinatra/json"

class TillTechTest < Sinatra::Base
  set :root, File.dirname(__FILE__)
  helpers Sinatra::JSON

  get '/' do
    erb :index 
  end

  get '/api/menu/thecafe' do
    json({ spaghetti: {name: 'Spaghetti', price: 5.0 }})
  end

end

