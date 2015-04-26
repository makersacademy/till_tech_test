module Discount

def item_discounts(item)
  item.name.include?("Muffin") ? @discount_factor = 0.9 : @discount_factor = 1.0
end

end