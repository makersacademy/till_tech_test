require_relative 'menu'
require_relative 'discount'

class Receipt

  include Menu
  include Discount

  attr_reader :order, :tax

  def initialize order, tax=0
    @order = order
    @tax = tax
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

  def discounted_total
    apply_discounts.round(2)
  end

  def after_tax_total
    (discounted_total + (discounted_total * (tax / 100))).round(2)
  end

  def generate
    receipt = []

    order.each {|line| receipt << build_line_for(line)}
    receipt << "Total #{sprintf("%.2f", subtotal)}"
  end

  private

  def build_line_for line
    "#{line[:item]} #{line[:quantity].to_i}x #{price_for(line[:item])}"
  end

end