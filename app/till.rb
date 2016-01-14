require 'json'

class Till

file = File.read('./hipstercoffee.json')
SHOP_DETAILS = JSON.parse(file)

  def initialize()
    @shop_details = SHOP_DETAILS
  end

  def shop_details
    @shop_details
  end

  def calculate_sum(order)
    total = 0
    order.each do |item, quantity|
      total += (shop_details[0]["prices"][0][item.to_s] * quantity)
    end
    total
  end

  def calculate_tax(sum)
    ((sum / 100) * 8.62).round(2)
  end

end
