class Receipt
  attr_reader :orders, :location

  def initialize options = {} 
    @orders    = options[:orders]
    @location  = options[:location]
    @total_payment = 0
  end

  def receipt_footer 
    {subtotal: calculate_total,
     tax: calculate_tax,
     total: calculate_total + calculate_tax,
     paid: @total_payment,
     change: calculate_change}.map {|k, v| [k, v.round(2)] }.to_h
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

  def calculate_tax
    location.calculate_tax calculate_total 
  end

  def receive_payment(payment)
    @total_payment += payment
  end

  def calculate_change
    @total_payment - (@orders.inject(0) {|sum, order| sum + order.cost } +
      calculate_tax)
  end

end

