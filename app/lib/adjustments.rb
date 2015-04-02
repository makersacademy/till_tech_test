class Adjustments
  attr_reader :discount_threshold, :discount_rate,
              :item_discount_rate, :item_on_discount

  def initialize
    @discount_threshold = 50
    @discount_rate = 0.95
    @item_on_discount = "Muffin"
    @item_discount_rate = 0.90
  end

  def discount(order_subtotal)
    if order_subtotal > discount_threshold
      (order_subtotal * discount_rate).round(2)
    else
      order_subtotal
    end
  end

  def item_discount(order)
    order.each do |item, arr|
      if item.include?(item_on_discount)
        (order[item] = [arr.first, (arr.last * item_discount_rate).round(2)])
      end
    end
  end

  def item_discount_total(order)
    total = [0]
    order.each do |item, _arr|
      total << order[item].last if item.include?(item_on_discount)
    end
    total.inject(:+)
  end
end
