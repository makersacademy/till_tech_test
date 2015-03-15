require 'sinatra/base'
require 'erb'
require "sinatra/json"
require './lib/menu'
require './lib/order_list'
require './lib/order'

class TillTechTest < Sinatra::Base
  set :root, File.dirname(__FILE__)
  helpers Sinatra::JSON

  order_list = OrderList.new
  menu       = Menu.new({latte: {name: 'Cafe Latte', price: 2.5 },
                'spaghetti' => {name: 'Spaghetti', price: 5.0 }})

  get '/' do
    erb :index 
  end

  ### API ###

  # returns mock data, for now.
  get '/api/location/thecafe/menu/:id' do
    json(menu.items)
  end

  put '/api/orderlist/1' do

  end

end

