require './lib/module'
require './lib/menu'
require './lib/order'
require './lib/receipt'

@menu = Menu.new
@order = Order.new({menu: @menu})
@receipt = Receipt.new(@order)