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
  set :menu      , Menu.new({'latte'    => {name: 'Cafe Latte', price: 2.5 },
                             'spaghetti'=> {name: 'Spaghetti' , price: 5.0 }})

  get '/' do
    send_file './app/views/index.html'
  end

  ### API ###

  # returns mock data, for now.
  get '/api/location/thecafe/menu/:id' do
    json(settings.menu.items.values.to_a)
  end

  get '/api/order/:id' do
    receipt = Receipt.new(settings.order_list)
    json(receipt.print)
  end

  put '/api/order/:id' do
    dish_name = params[:itemname].downcase
    settings.order_list.receive_order(Order.new(settings.menu.order(dish_name)))
  end

end

