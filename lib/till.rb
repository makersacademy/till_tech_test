class Till

  attr_reader :items
  attr_reader :prices

  def initialize
    @items = []
    @prices = list_prices
  end

  def add item, quantity=1
    items.push({item: item, quantity: quantity})
  end

  def individual_price item
    @prices[item]
  end

  def list_prices
    file = File.read('itemlist.json')
    @prices = JSON.parse(file).first['prices'].first
  end

end