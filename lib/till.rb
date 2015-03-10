class Till

  attr_accessor :order
  attr_reader :prices

  def initialize
    @order = []
    get_prices
  end

  def add_order_item(args)
    item = args[:item]
    quantity = args[:quantity]
    unit_price = price_of(item)
    @order.push({item: item, quantity: quantity, unit_price: unit_price})
  end

  def reset_order
    @order.clear
  end

  def price_of(item)
    @prices[item]
  end

  def get_prices
    file = File.read('./hipstercoffee.json')
    @prices = JSON.parse(file).first['prices'].first
  end

end
