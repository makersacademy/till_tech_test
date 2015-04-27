require_relative 'order'
require_relative 'receipt'
require_relative 'payment'
require_relative 'menu'


class Till

  include Menu

  attr_reader :order, :receipt, :tax, :change

  def initialize
    @tax = 8.64
    menu_read_price_list
    new_order
  end

  def new_order
    @order = Order.new
    @receipt = nil
    @change = nil
  end

  def order_list
    order.order_list
  end

  def add_item_to_order(item, quantity)
    order.add_item(item, quantity)
  end

  def print_receipt
    @receipt = Receipt.new(order_list, tax)
    receipt.print_receipt
  end

  def total_due
    @receipt ? receipt.total_due : 'Please generate a receipt'
  end

  def payment(money_tendered)
    payment = Payment.new
    @change = payment.payment_result(money_tendered, total_due)
  end

end
