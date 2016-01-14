require 'json'

class Till

file = File.read('./hipstercoffee.json')
SHOP_DETAILS = JSON.parse(file)
TAX_RATE = 8.62

  def initialize()
    @shop_details = SHOP_DETAILS
  end

  def shop_details
    @shop_details
  end

  def calculate_sum(order)
    @total = 0
    @tax = 0
    order.each do |item, quantity|
      @total += (shop_details[0]["prices"][0][item.to_s] * quantity)
    end
    @total
  end

  def calculate_tax(sum)
    tax = ((sum / 100) * TAX_RATE).round(2)
  end

  def calculate_change(sum, payment_received)
    payment_received - sum
  end

  def apply_discount(sum)
    sum > 50 ? sum -= (sum * 0.05) : sum
  end

end
