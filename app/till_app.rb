require 'sinatra/base'
require './app/lib/shop'
require './app/lib/order'

class TillApp < Sinatra::Base

	set :views, Proc.new { File.join(root, "views") } 

	shop = Shop.new('hipstercoffee.json')
	order = Order.new("Bob")
	# order.record_item("Cafe Latte", shop.options("Cafe Latte"), 10)

  get '/' do
  	@menu = shop.menu
  	@order_so_far = order.complete_list
  	@order_name = order.customer_name
    erb :index
  end

  post '/add_order' do
  	@item_to_add = params[:item]
  	@item_price = params[:price].to_i
  	order.record_item("#{@item_to_add}", @item_price, 1)
  	redirect '/'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
