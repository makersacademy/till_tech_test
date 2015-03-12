require_relative 'menu'
require_relative 'discount'


class Receipt

  attr_reader :tax

  include Menu
  include Discounts

  def initialize(tax = 0)
    @tax = tax
    read_price_list
  end

  def price_of(item)
    price_list[item]
  end

  def line_price(order_line)
    order_line[:quantity] * price_of(order_line[:item])
  end

  def net_total(order)
    order.inject(0) { |memo, line| memo + line_price(line) }
  end

end
