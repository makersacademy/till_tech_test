require_relative 'menu'
require_relative 'discount'


class Receipt

  attr_reader :tax, :order

  include Menu
  include Discounts

  def initialize(order, tax = 0)
    @tax = tax
    @order = order
    menu_read_price_list
  end

  def price_of(item)
    price_list[item]
  end

  def line_price(order_line)
    order_line[:quantity] * price_of(order_line[:item])
  end

  def net_total
    order.inject(0) { |memo, line| memo + line_price(line) }
  end

  def tax_total
    (tax / 100 * (net_total - discount_total)).round(2)
  end

  def total_due
    net_total - discount_total + tax_total
  end

  def print_receipt
    receipt = []
    order.each {|line| receipt << "#{line[:item]} #{line[:quantity]} x #{'%.2f' % price_of(line[:item])}"}
    receipt << "Discount #{'%.2f' % discount_total}" if discount_total > 0
    receipt << "Tax #{'%.2f' % tax_total}"
    receipt << "Total #{'%.2f' % total_due}"
    return receipt
  end



end
