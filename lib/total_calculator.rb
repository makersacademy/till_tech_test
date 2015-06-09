class TotalCalculator
  PRICE_LIST = {cappucino: 3.85, cortado: 4.55}

  def self.calculate_total order
    total = 0
    order.items.each do |item, quantity|
      total+= PRICE_LIST[item] * quantity
    end
    total
  end
end