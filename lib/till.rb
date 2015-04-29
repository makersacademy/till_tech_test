class Till

  def initialize
    @order_items = []
  end

  def order item
    @order_items << item
  end

  def cash_out
    order_total
  end

  def order_total
   @order_items.map{|item| item.price}.inject(:+)
  end
end