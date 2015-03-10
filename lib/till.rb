require './lib/receipt'

class Till

  attr_reader :orders
  attr_accessor :tax_rate

  def initialize(shop_information)
    @orders  = []
  end

  def receive_order(order)
    orders.push order
  end

  def order_information
    {orders: self.orders,
     subtotal: calculate_total,
     tax: calculate_tax,
     total: calculate_total + calculate_tax} 
  end

  def calculate_total
    self.orders.inject(0) {|sum, order| sum + order.cost }
  end

  def calculate_tax
    calculate_total * tax_rate
  end
end

