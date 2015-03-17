require 'sinatra/base'
require "sinatra/json"
require './lib/menu'
require './lib/order_list'
require './lib/order'
require './lib/tax'
require './lib/discount'
require './lib/receipt'
require './lib/payment'
require './app/modules/my_helpers'


class TillTechTest < Sinatra::Base
  set :root, File.dirname(__FILE__)
  helpers Sinatra::JSON
  include MyHelpers
  set :static, true
  
  set :order_list, OrderList.new
  set :menu      , Menu.new([{name: 'Cafe Latte', price: 2.5 },
                             {name: 'Cappucino' , price: 3.0 },
                             {name: 'Flat White', price: 2.3 },
                             {name: 'Lasange'   , price: 5.0 },
                             {name: 'Risotto'   , price: 4.5 },
                             {name: 'Tiramisu'  , price: 3.6 } 
                            ])
  
  set :utilities, { tax: Tax.new("17.5%"),
               discount: Discount.new(discount: '10%', discountable?: proc{|value| value > 30},
                                      description: '10% discount if you spend over 30.0!') }

  get '/' do
    reset :order_list
    send_file './app/views/index.html'
  end

  ### API ###

  # returns mock data, for now.
  get '/api/location/thecafe/menu/:id' do
    json(settings.menu.items)
  end

  get '/api/order/:id' do
    receipt = Receipt.new(settings.order_list, settings.utilities)
    json(receipt.print)
  end

  post '/api/order/:id' do
    dish_name = params[:itemname]
    settings.order_list.receive_order(Order.new(settings.menu.order(dish_name)))
  end

  put '/api/order/:id' do
    add_to_utilities({ payment: Payment.new(params[:payment]) })
    {}
  end

end


