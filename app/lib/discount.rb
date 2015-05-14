module Discount

  def apply_discounts
    subtotal - threshold_discount - item_discount('Muffin')
  end

  def threshold_discount
    (subtotal >= 50) ? (subtotal * 0.05) : 0
  end

  def item_discount item
    discountable_items = select_matching_items(item)
    discountable_total = matching_items_total(discountable_items)
    (discountable_total > 0) ? calculate_discount_for(discountable_total) : 0
  end

  private

  def calculate_discount_for amount
    amount * 0.1
  end

  def select_matching_items item
    order.select {|line| line[:item].include? item}
  end

  def matching_items_total items
    items.inject(0){|memo, item| memo + line_price_for(item)}
  end

end
