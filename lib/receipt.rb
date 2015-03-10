class Receipt
  attr_reader :orders

  def initialize orders
    @orders = orders
  end

  def receipt_footer 
    {subtotal: calculate_total,
     tax: calculate_tax(0.04),
     total: calculate_total + calculate_tax(0.04)}
  end

  def print 
    items = itemize(orders)
    {items: items}.merge receipt_footer 
  end

  def itemize orders
    orders.map do |order|
      {name: order.name, quantity: orders.select {|ord| ord.name == order.name}.count,
       cost: order.cost * orders.select {|ord| ord.name == order.name}.count }
    end.uniq
  end

  def calculate_total
    self.orders.inject(0) {|sum, order| sum + order.cost }
  end

  def calculate_tax tax_rate
    calculate_total * tax_rate
  end

end

