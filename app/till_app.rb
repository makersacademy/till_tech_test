require 'sinatra/base'
require './app/lib/shop'
require './app/lib/order'
require './app/lib/till'
require './app/lib/adjustments'

class TillApp < Sinatra::Base

	set :views, Proc.new { File.join(root, "views") } 

	shop = Shop.new
	order = Order.new
	till = Till.new
  adjustments = Adjustments.new
  

  get '/' do
  	@menu = shop.menu
  	@order_so_far = order.list
  	@order_confirmed = order.confirmed
    erb :index
  end

  get '/order' do
  	@items = order.list
  	@total = till.total_of(@items, adjustments)
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
  	if order.list == {}
  		redirect '/'
  	else
  		order.confirm_order?
  		redirect '/order'
  	end
  end

  get '/make_payment' do
    @order = till.print_receipt_body(order.list)
    @subtotal = till.subtotal_of(order.list)
    @total = till.total_of(order.list, adjustments)
    @tax = till.tax_total(order.list, adjustments)
    @item_on_offer = adjustments.item_on_discount
    @cash_taken = params[:cash].to_f
    @change_owed = till.calculate_change(@cash_taken, @total)
    @item_discount_total = adjustments.item_discount_total(order.list)
    @shop_details = till.print_receipt_head(shop.array_of_details)
    erb :receipt
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
