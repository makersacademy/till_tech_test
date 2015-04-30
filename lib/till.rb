class Till
  TAX_RATE = 0.0864

  def initialize
    @order_items = []
  end

  def order(item)
    @order_items << item
  end

  def cash_out
    @order_items.map(&:price).inject(:+)
  end

  def item_total(type)
    @order_items.select { |item| item == type }.map(&:price).inject(:+)
  end

  def tax
    (cash_out * TAX_RATE).round(2)
  end
end
