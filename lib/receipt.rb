require 'menu'

class Receipt

  include Menu

  attr_reader :order

  def initialize order
    @order = order
    load_price_list
  end

  def price_for item
    price_list[item]
  end

  def line_price_for line
    price_for(line[:item]) * line[:quantity]
  end

  def subtotal
    order.inject(0){|memo, line| memo + line_price_for(line)}.round(2)
  end

  def generate
    receipt = []
    order.each {|line| receipt << build_receipt_line_for(line)}
    receipt << "Total #{sprintf("%.2f", subtotal)}"
  end

  private

  def build_receipt_line_for line
    "#{line[:item]} #{line[:quantity]}x #{price_for(line[:item])}"
  end

end