require 'sinatra/base'
require './app/lib/shop'
require './app/lib/order'
require './app/lib/till'

class TillApp < Sinatra::Base

	set :views, Proc.new { File.join(root, "views") } 

	shop = Shop.new('hipstercoffee.json')
	order = Order.new("Bob")
	till = Till.new

  get '/' do
  	@menu = shop.menu
  	@order_so_far = order.complete_list
  	@order_name = order.customer_name
  	@order_confirmed = order.confirmed
    erb :index
  end

  get '/order' do
  	@ordered_items = order.complete_list
  	@total = till.total_of(order.complete_list)
  	erb :order
  end

  post '/add_order' do
  	@item_to_add = params[:item]
  	@item_price = params[:price].to_f
  	order.record_item("#{@item_to_add}", @item_price, 1)
  	redirect '/'
  end

  post '/clear_order' do
  	order.clear_order
  	redirect '/'
  end

  post '/confirm_order' do
  	if order.complete_list == {}
  		redirect '/'
  	else
  		order.confirm_order?
  		redirect '/order'
  	end
  end

  get '/make_payment' do
    @total = till.total_of(order.complete_list)
    @cash_taken = params[:cash].to_f
    @change_owed = till.calculate_change(@cash_taken, @total)
    @order = order.complete_list
    @item_discount_total = till.item_discount_total(order.complete_list)
    erb :receipt
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
