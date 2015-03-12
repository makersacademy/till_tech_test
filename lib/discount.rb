module Discounts

  def discount(order)
    discount = 0
    discount += discount_total_price(net_total)
    discount += discount_muffins(order)
    return (discount).round(2)
  end

  def discount_total_price(net_total)
    discount_level = 5
    discount_applied_at = 50
    net_total > discount_applied_at ? calculate_discount(net_total, discount_level) : 0
  end

  def discount_muffins(order)
    discount_level = 10
    matched_order_lines = order.select {|line| line[:item].include?('Muffin')}
    matched_total = matched_order_lines.inject(0){ | memo, n| memo + line_price(n) }
    matched_total > 0 ? calculate_discount(matched_total, discount_level).round(2) : 0
  end

  def calculate_discount(total_to_be_discounted, discount_level)
    total_to_be_discounted.to_f * discount_level / 100
  end


end
