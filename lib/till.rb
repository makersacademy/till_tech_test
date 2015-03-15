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
    order.list_current_order
  end

end