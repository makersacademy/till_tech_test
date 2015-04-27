require 'sinatra'
require './lib/menu'
require './lib/customer'
require './lib/item'
require './lib/order'

set :public_folder, proc { File.join(root) }

  menu = Menu.new
  order = Order.new
  item = Item.new


get '/' do

  @menu_items = menu.all_item_names
  @menu_prices = menu.all_item_values

  
  
  # @order.current_order

  # @order = order
  # item = Item.new(params[:item_name], params[:item_price]) 
  # item.name = params[:item_name]
  # item.price = params[:item_price]
  # @order_price = order.total_price_per_item("Bob", item)
  # @item_price = item.price
  # item.name = @item_name
  erb :index
end

post '/' do

  item.name = params[:item_name]
  item.price = params[:item_price]
  order.current_order.add_item_to_order("Bob",item, 1)


erb :index
end
