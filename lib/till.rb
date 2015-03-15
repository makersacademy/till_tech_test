require 'menu'
require 'order'

class Till

  include Menu

  attr_reader :order

  def initialize
    new_order
    load_price_list
  end

  def new_order
    @order = Order.new
  end

  def current_order
    order.current
  end

  def add_item item, quantity=1
    order.add(item, quantity)
  end

end