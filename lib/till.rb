require 'byebug'

class Till

  attr_reader :orders, :prices
  attr_accessor :tax_rate, :total_payment

  def initialize prices
    @orders         = []
    @prices         = prices
    @total_payment  = 0
  end

  def receive_order(order)
    order.cost = prices[order.name] 
    orders.push order
  end

  
end


