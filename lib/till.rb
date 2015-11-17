class Till

  def self.total_before_tax
    order = customer_order[:order]
    prices = coffee_shop[:prices]

    total = 0

    order.each do |item, quantity|
      total += quantity * prices[item]
    end
    return total
  end

  def self.bill_tax
    tax = coffee_shop[:tax]
    return (tax * total_before_tax).round(2)
  end

  def self.line_entries
    order = customer_order[:order]
    prices = coffee_shop[:prices]

    order.map {|item, quantity| [item, {:quantity=> quantity, :item_price=>prices[item], :line_total=>quantity * prices[item]}]}.to_h
  end



  # Getting and setting menus/order
  def self.coffee_shop=(shop)
    @coffee_shop = shop
  end

  def self.coffee_shop
    @coffee_shop
  end

  def self.customer_order=(order)
    @customer_order = order
  end

  def self.customer_order
    @customer_order
  end

end
