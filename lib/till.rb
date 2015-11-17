class Till

  def self.coffee_shop=(shop)
    @coffee_shop = shop
  end

  def self.customer_order=(order)
    @customer_order = order
  end

  def self.line_entries
    prices = coffee_shop[:prices]
    customer_order[:order].map { |item, quantity| [item, {
      quantity: quantity,
      item_price: prices[item],
      line_total: quantity * prices[item] }] }.to_h
  end

  def self.total_before_tax
    line_entries.to_a.map { |item| item[1][:line_total] }.inject(&:+)
  end

  def self.bill_tax
    (coffee_shop[:taxRate] * total_before_tax).round(2)
  end

  def self.receipt
    return {
      items: line_entries,
      total_before_tax: total_before_tax,
      tax: bill_tax,
      total_inc_tax: total_before_tax + bill_tax }
  end

private

  def self.coffee_shop
    @coffee_shop
  end

  def self.customer_order
    @customer_order
  end

end
