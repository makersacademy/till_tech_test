class Till

  attr_accessor :order
  attr_reader :prices

  def initialize
    @order = {}
    @prices = get_prices
  end

  def add_order_item(args)
    item = args[:item]
    quantity = args[:quantity]
    @order[item] = quantity
  end

  def reset_order
    @order.clear
  end

  def price_of(item)
    return 4.75
  end

  def get_prices
    file = File.read('hipstercoffee.json')
    prices = JSON.parse(file)['prices']
  end

end
