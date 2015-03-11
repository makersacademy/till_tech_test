class Till
  attr_reader :orders
  attr_accessor :tax_rate, :total_payment

  def initialize prices
    @orders         = []
    @total_payment  = 0
  end

  def receive_order(order)
    orders.push order
  end
  
end


