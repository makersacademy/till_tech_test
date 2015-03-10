require './lib/receipt'

class Till

  attr_reader :receipt

  def initialize(shop_information)
    @order_information = {}
  end

  def receive_order(order)

  end

  def receipt 
    Receipt.new(@order_information) 
  end

end

