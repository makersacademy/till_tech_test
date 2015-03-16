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

  order_list = OrderList.new
  menu       = Menu.new({'latte'    => {name: 'Cafe Latte', price: 2.5 },
                        'spaghetti' => {name: 'Spaghetti', price: 5.0 }})

  get '/' do
    send_file 'index.html'
  end

  ### API ###

  # returns mock data, for now.
  get '/api/location/thecafe/menu/:id' do
    json(menu.items)
  end

  get '/api/order/1' do
    receipt = Receipt.new(order_list)
    json(receipt.print)
  end

  put '/api/order/1' do
    dish_name = params[:itemname].downcase
    order_list.receive_order(Order.new(menu.order(dish_name)))
  end

end

