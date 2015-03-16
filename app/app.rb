require 'sinatra/base'
require 'erb'
require "sinatra/json"
require './lib/menu'
require './lib/order_list'
require './lib/order'
require './lib/receipt'

class TillTechTest < Sinatra::Base
  set :root, File.dirname(__FILE__)
  helpers Sinatra::JSON
  set :static, true
  
  set :order_list, OrderList.new
  set :menu      , Menu.new([{name: 'Cafe Latte', price: 2.5 },
                             {name: 'Cappucino' , price: 3.0 },
                             {name: 'Flat White', price: 2.3 },
                             {name: 'Lasange'   , price: 5.0 },
                             {name: 'Risotto'   , price: 4.5 },
                             {name: 'Tiramisu'  , price: 3.6 } 
                            ])

  get '/' do
    self.settings.order_list = OrderList.new
    send_file './app/views/index.html'
  end

  ### API ###

  # returns mock data, for now.
  get '/api/location/thecafe/menu/:id' do
    json(settings.menu.items)
  end

  get '/api/order/:id' do
    receipt = Receipt.new(settings.order_list)
    json(receipt.print)
  end

  post '/api/order/:id' do
    dish_name = params[:itemname]
    settings.order_list.receive_order(Order.new(settings.menu.order(dish_name)))
  end

end

