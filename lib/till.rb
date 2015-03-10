require 'byebug'

class Till

  attr_reader :orders, :prices
  attr_accessor :tax_rate

  def initialize prices
    @orders   = []
    @prices   = prices
  end

  def receive_order(order)
    order.cost = prices[order.name] 
    orders.push order
  end

end


