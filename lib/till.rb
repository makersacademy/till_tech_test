class Till

  TAX_RATE = 8.64

  attr_reader :discounts

  def initialize(options)
    @company_name = options[:shopName]
    @address = options[:address]
    @phone = options[:phone]
    @prices = options[:prices]
    @discounts = []
    @discount_amount = 0
  end

  def total(order)
    @current_order = order
    calculate_sub_total
    calculate_total
    { amount_due: @total }
  end

  def take_payment(amount_paid)
    produce_receipt(amount_paid)
  end

  def add_discount(discount)
    @discounts <<  discount
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
      items: itemise,
      tax: tax,
      subtotal: @subtotal,
      discount: @discount_amount,
      total: @total.round(2),
      cash: amount_paid,
      change: (amount_paid - @total).round(2)
    }
  end

  def calculate_total
    @total = (@subtotal + tax).round(2)
    discount_check
  end

  def discount_check
    apply_discount if @discounts.any?
  end

  def apply_discount
    @discounts.each do |discount|
      amount_discount(discount) if discount.type == :amount
      line_discount(discount) if discount.type == :line
    end
    subtract_discount
  end

  def subtract_discount
    @total -= @discount_amount
  end

  def amount_discount(discount)
    @discount_amount +=  (discount.percent / 100 * @total).round(2) if @total > discount.trigger
  end

  def line_discount(discount)
    @discount_amount += (discount.percent / 100 * sum_items(discount_lines(discount.line))).round(2)
  end

  def discount_lines(line)
    @current_order.items.select { |item| item.upcase.include?(line.upcase) }
  end

  def itemise
    quantify(@current_order.items).map { | item, quantity | { item: item, quantity: quantity, price: price(item) } }
  end

  def quantify(items)
    items.each_with_object(Hash.new(0)) { |item, count| count[item] += 1 }
  end

  def price(item)
     @prices[item]
  end

  def calculate_sub_total
    @subtotal = sum_items(@current_order.items)
  end

  def sum_items(items)
    items.inject(0) { | sum, item | sum += price(item) }
  end

  def tax
    (@subtotal / 100 * TAX_RATE).round(2)
  end

  def time_stamp
    Time.now.strftime("%Y.%m.%d %H:%M:%S")
  end

end
