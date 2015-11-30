class Till

  TAX_RATE = 8.64

  def initialize(options)
    @company_name = options[:shopName]
    @address = options[:address]
    @phone = options[:phone]
    @prices = options[:prices]
  end

  def process_order(order)
    sub_total(order)
    produce_receipt(order)
  end

  private

  def produce_receipt(order)
    {
      time: time_stamp,
      name: @company_name,
      address: @address,
      phone: @phone,
      table: order.table,
      customers: order.customers,
      items: itemise(order),
      tax: tax,
      subtotal: @sub_total,
      total: @sub_total + tax
    }
  end

  def itemise(order)
    quantify(order.items).map { | item, quantity | { item: item, quantity: quantity, price: price(item) } }
  end

  def quantify(items)
    items.each_with_object(Hash.new(0)) { |item, count| count[item] +=1 }
  end

  def price(item)
     @prices[item]
  end

  def sub_total(order)
    @sub_total = order.items.inject(0) { | sum, item | sum += price(item) }
  end

  def tax
    (@sub_total / 100 * TAX_RATE).round(2)
  end

  def time_stamp
    Time.now.strftime("%Y.%m.%d %H:%M:%S")
  end

end
