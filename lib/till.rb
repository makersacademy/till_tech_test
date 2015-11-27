class Till

  TAX_RATE = 8.64

  def initialize(options)
    @company_name = options[:name]
    @address = options[:address]
    @phone = options[:phone]
    @prices = options[:prices]
  end

  def produce_receipt(order)
    sub_total(order)
    {
      name: @company_name,
      address: @address,
      phone: @phone,
      server: order.server,
      items: itemise(order),
      tax: tax,
      total: @sub_total + tax
    }
  end

  private

  def itemise(order)
    order.items.map { | name, quantity | { name: name, quantity: quantity, price: item_price(name) } }
  end

  def item_price(name)
     @prices[name]
  end

  def sub_total(order)
    @sub_total = order.items.inject(0) { | sum, item | sum += @prices[item[0]] * item[1]  }
  end

  def tax
    (@sub_total / 100 * TAX_RATE).round(2)
  end

end
