module Discounts

  def discount
    discount = 0
    discount += discount_total_price
    discount += discount_muffins
    return (discount).round(2)
  end

  def discount_total_price
    discount_level = 5
    discount_applied_at = 50
    net_total > discount_applied_at ? (net_total * discount_level / 100).round(2) : 0
  end

  def discount_muffins
    matched_order_lines = order.select {|line| line[:item].include?('Muffin')}
    matched_total = matched_order_lines.inject(0){ | memo, n| memo + line_price(n) }
    matched_total > 0 ? (matched_total * 10 / 100).round(2) : 0
  end


end
