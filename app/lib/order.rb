class Order

  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add_item(item, quantity)
    order_list.push({item: item, quantity: quantity})
  end

end
