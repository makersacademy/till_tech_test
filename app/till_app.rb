require "sinatra/base"
require "./app/lib/shop"
require "./app/lib/order"
require "./app/lib/till"
require "./app/lib/adjustments"

class TillApp < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") } 

  shop = Shop.new
  order = Order.new
  till = Till.new
  adjustments = Adjustments.new
  
  get "/" do
    @menu = shop.menu
    @order_so_far = till.print_receipt_body(order.list)
    @order_confirmed = order.confirmed
    erb :index
  end

  get "/order" do
    @items = till.print_receipt_body(order.list)
    @total = till.total_of(order.list, adjustments)
    erb :order
  end

  post "/add_order" do
    @item_to_add = params[:item]
    @item_price = params[:price].to_f
    order.record_item("#{@item_to_add}", @item_price, 1)
    redirect "/"
  end

  post "/clear_order" do
    order.clear_order
    redirect "/"
  end

  post "/confirm_order" do
    if order.list == {}
      redirect "/"
    else
      order.confirm_order?
      redirect "/order"
    end
  end

  get "/make_payment" do
    @cash_taken = params[:cash].to_f
    @subtotal = till.subtotal_of(order.list)
    @change_owed = till.calculate_change(@cash_taken, till.total_of(order.list, adjustments))
    @shop_details = till.print_receipt_head(shop.array_of_details)
    @order = till.print_receipt_body(order.list)
    @receipt_footer = till.print_receipt_footer(order.list, adjustments, @cash_taken)
    erb :receipt
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
