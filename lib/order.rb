class Order

  attr_accessor :items

  def initialize
    @items = {}
  end

  def add_item(item, quantity)
    @items[item] = quantity
  end

end
