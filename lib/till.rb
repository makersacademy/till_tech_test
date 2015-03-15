require 'menu'
require 'order'

class Till

  include Menu

  attr_reader :order, :tax, :receipt

  def initialize
    new_order
    load_price_list
    @tax = 8.64
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

  def generate_receipt
    @receipt = Receipt.new(order).generate
  end

end