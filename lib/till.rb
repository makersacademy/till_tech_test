class Till

  def initialize
    @order_items = []
  end

  def order item
    @order_items << item
  end

  def cash_out
    @order_items.map { |item| item.price }.inject(:+)
  end

  def item_total(type)
    @order_items.select { |item| item == type }.map { |item| item.price }.inject(:+)
  end

end