class Till

  attr_reader :items, :prices

  def initialize
    @items = []
    list_prices
  end

  def add args
    item = args[:item]
    quantity = args[:quantity]
    items.push({item: item, quantity: quantity})
  end

  def list_prices
    file = File.read('itemlist.json')
    @prices = JSON.parse(file).first['prices'].first
  end

  def price_of item 
    list_prices[item]
  end

  def order_price new_item_order
    new_item_order[:quantity] * price_of(new_item_order[:item])
  end

  def net_total
    items.inject(0) { | memo, n | memo + order_price(n) }
  end

  def tax net_total
    (net_total * 8.64 / 100).round(2)
  end

end