class Till

  TAX_RATE = 8.64

  def initialize(options)
    @company_name = options[:shopName]
    @address = options[:address]
    @phone = options[:phone]
    @prices = options[:prices]
  end

  def total(order)
    @current_order = order
    sub_total(order)
    { amount_due: total_amount }
  end

  def take_payment(amount_paid)
    produce_receipt(amount_paid)
  end

  private

  def produce_receipt(amount_paid)
    {
      time: time_stamp,
      name: @company_name,
      address: @address,
      phone: @phone,
      table: @current_order.table,
      customers: @current_order.customers,
      items: itemise(@current_order),
      tax: tax,
      subtotal: @subtotal,
      total: total_amount,
      cash: amount_paid,
      change: amount_paid - total_amount
    }
  end

  def total_amount
    @subtotal + tax
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
    @subtotal = order.items.inject(0) { | sum, item | sum += price(item) }
  end

  def tax
    (@subtotal / 100 * TAX_RATE).round(2)
  end

  def time_stamp
    Time.now.strftime("%Y.%m.%d %H:%M:%S")
  end

end
