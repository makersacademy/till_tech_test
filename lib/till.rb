class Till

  def self.coffee_shop=(shop)
    @coffee_shop = shop
  end

  def self.customer_order=(order)
    @customer_order = order
  end

  def self.line_entries
    prices = coffee_shop[:prices]
    customer_order[:order].map { |item, quantity|
      [item, {
        quantity: quantity,
        item_price: prices[item],
        line_total: quantity * prices[item]
      }]
    }.to_h
  end

  def self.total_before_discounts
    line_entries.to_a.map { |item| item[1][:line_total] }.inject(&:+).round(2)
  end

  def self.discounts
    discounts = {}
    prices = coffee_shop[:prices]
    item_discounts = coffee_shop[:itemDiscounts]
    bill_discount = coffee_shop[:billDiscount]
    threshold = bill_discount[:threshold]
    customer_order[:order].each do |item, quantity|
      rate = item_discounts[item]
      if rate
        item_discount = (quantity * prices[item] * rate).round(2)
        key = "#{(rate*100).round}% #{item} discount".to_sym
        discounts[key] = item_discount
      end
    end
    if total_before_discounts > threshold
      rate = bill_discount[:rate]
      key = "#{(rate*100).round}% off bill over $#{threshold}".to_sym
      discounts[key] = (total_before_discounts * rate).round(2)
    end
    discounts
  end

  def self.total_before_tax
    total_discounts = discounts.to_a.map { |item| item[1] }.inject(&:+).round(2)
    total_before_discounts - total_discounts
  end

  def self.bill_tax
    (coffee_shop[:taxRate] * total_before_tax).round(2)
  end

  def self.total_inc_tax
    (total_before_tax + bill_tax).round(2)
  end

  def self.change
    (customer_order[:payment] - bill_tax - total_before_tax).round(2)
  end

  def self.receipt
    { items: line_entries,
      total_before_discounts: total_before_discounts,
      discounts: discounts,
      total_before_tax: total_before_tax,
      tax: bill_tax,
      total_inc_tax: total_inc_tax,
      payment: customer_order[:payment],
      change: change
    }
  end

private

  def self.coffee_shop
    @coffee_shop
  end

  def self.customer_order
    @customer_order
  end

end
