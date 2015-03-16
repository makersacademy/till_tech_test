class Receipt

  attr_reader :order

  def initialize(order)
    @order = order || []
  end

  def list_items
    order.items.each {|item| puts item}
  end





end