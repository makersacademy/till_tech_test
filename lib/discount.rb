module Discount

MUFFIN_DISCOUNT = 0.1
TOTAL_DISCOUNT_THRESHOLD = 50
TOTAL_DISCOUNT = 0.05

def item_discounts(item)
  item.name.include?("Muffin") ? @discount_factor = (1 - MUFFIN_DISCOUNT) : @discount_factor = 1.0
end

def total_discounts(total_price)
  total_price >= TOTAL_DISCOUNT_THRESHOLD ? total_price = total_price * (1 - TOTAL_DISCOUNT) : total_price 
end

end