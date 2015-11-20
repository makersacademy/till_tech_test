class Till

  @cache = {}

  class << self

    attr_writer :coffee_shop, :customer_order

    def items
      @cache[:items] = @cache[:items] || calc_items
    end

    def items_total
      @cache[:items_total] = @cache[:items_total] || calc_items_total
    end

    def discounts
      @cache[:discounts] = @cache[:discounts] || calc_discounts
    end

    def total_inc_disc
      @cache[:total_inc_disc] = @cache[:total_inc_disc] || calc_total_inc_disc
    end

    def bill_tax
      (tax_rate * total_inc_disc).round
    end

    def total_inc_tax
      total_inc_disc + bill_tax
    end

    def change
      payment - total_inc_tax
    end

    def receipt
      {
        items: items, items_total: items_total, discounts: discounts,
        total_inc_disc: total_inc_disc, bill_tax: bill_tax,
        total_inc_tax: total_inc_tax, payment: payment, change: change
      }
    end

    private

    attr_reader :coffee_shop, :customer_order

    def prices
      coffee_shop[:prices]
    end

    def tax_rate
      coffee_shop[:tax_rate]
    end

    def order
      customer_order[:order]
    end

    def payment
      customer_order[:payment]
    end

    def calc_items
      order.map { |item, quantity| [item, item_data(item, quantity)] }.to_h
    end

    def item_data(item, quantity)
      {quantity: quantity, price: prices[item], sum: quantity * prices[item]}
    end

    def calc_items_total
      items.map { | _, item_data | item_data[:sum] }.inject(&:+)
    end

    def calc_discounts
      item_discounts.merge(bill_discount)
    end

    def item_discounts
      discounts = {}
      coffee_shop[:discounts].each do |item, rate|
        next unless order[item]
        discounts[item] = item_discount_data(item, order[item], rate)
      end
      discounts
    end

    def item_discount_data(item, quantity, rate)
      {rate: rate, amount: (quantity * prices[item] * rate).round}
    end

    def bill_discount
      return {} unless coffee_shop[:bill_discount]
      threshold = coffee_shop[:bill_discount][:threshold]
      return {} unless items_total > threshold
      rate = coffee_shop[:bill_discount][:rate]
      {bill: bill_discount_data(rate, threshold)}
    end

    def bill_discount_data(rate, threshold)
      {rate: rate, threshold: threshold, amount: (items_total * rate).round}
    end

    def calc_total_inc_disc
      items_total - discounts.map { |_, disc | disc[:amount] }.inject(&:+)
    end

  end

end
