module Discounts

  def discount_total
    discount = 0
    discount += discount_total_price
    discount += discount_muffins
    discount.round(2)
  end

  def discount_total_price
    discount_level = 5
    discount_start = 50
    net_total > discount_start ? calc_discount(net_total, discount_level) : 0
  end

  def discount_muffins
    discount_level = 10
    matched_lines = order.select { |line| line[:item].include?('Muffin') }
    matched_total = matched_lines.inject(0) { |memo, n| memo + line_price(n) }
    matched_total > 0 ? calc_discount(matched_total, discount_level) : 0
  end

  def calc_discount(total_to_be_discounted, discount_level)
    total_to_be_discounted.to_f * discount_level / 100
  end

end
