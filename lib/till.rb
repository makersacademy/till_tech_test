require 'byebug'

class Till

  attr_reader :orders, :prices
  attr_accessor :tax_rate

  def initialize
    @orders   = []
    @tax_rate = 0.04
  end

  def receive_order(order, price)
    order.cost = price 
    orders.push order
  end

  end

