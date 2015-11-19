class Till

  class << self

    attr_accessor :coffee_shop, :customer_order

    def items
      order.map { |item, quantity| [item, item_data(item, quantity)] }.to_h
    end

    def items_total
      items.map { | _, item_data | item_data[:sum] }.inject(&:+)
    end

    def discounts
      item_discounts.merge(bill_discount)
    end

    def total_inc_discounts
      items_total - discounts.map { |_, disc | disc[:amount] }.inject(&:+)
    end

    def bill_tax
      (coffee_shop[:tax_rate] * total_inc_discounts).round
    end

    def total_inc_tax
      total_inc_discounts + bill_tax
    end

    def change
      customer_order[:payment] - bill_tax - total_inc_discounts
    end

    def receipt
      {
        items: items, items_total: items_total, discounts: discounts,
        total_inc_discounts: total_inc_discounts, tax: bill_tax, change: change,
        total_inc_tax: total_inc_tax, payment: customer_order[:payment]
      }
    end

    private

    def prices
      coffee_shop[:prices]
    end

    def order
      customer_order[:order]
    end

    def item_data(item, quantity)
      {quantity: quantity, price: prices[item], sum: quantity * prices[item]}
    end

    def item_discounts
      discounts = {}
      order.each do |item, quantity|
        rate = coffee_shop[:discounts][item]
        discounts[item] = item_discount_data(item, quantity, rate) if rate
      end
      discounts
    end

    def item_discount_data(item, quantity, rate)
      {rate: rate, amount: (quantity * prices[item] * rate).round}
    end

    def bill_discount
      threshold = coffee_shop[:bill_discount][:threshold]
      return unless items_total > threshold
      rate = coffee_shop[:bill_discount][:rate]
      {bill: bill_discount_data(rate, threshold)}
    end

    def bill_discount_data(rate, threshold)
      {rate: rate, threshold: threshold, amount: (items_total * rate).round}
    end

  end

end
