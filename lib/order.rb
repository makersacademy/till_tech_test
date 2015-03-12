class Order

  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add_item(order_line)
    item = order_line[:item]
    quantity = order_line[:quantity]
    order_list.push({item: item, quantity: quantity})
  end

end
