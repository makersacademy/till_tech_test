require './lib/receipt'
require 'byebug'

class Till

  attr_reader :orders, :prices
  attr_accessor :tax_rate

  def initialize(prices)
    @orders  = []
    @prices  = prices
    @tax_rate= 0.04
  end

  def receive_order(order)
    order.cost = prices[order.name]
    orders.push order
  end

  def receipt_footer 
    {subtotal: calculate_total,
     tax: calculate_tax,
     total: calculate_total + calculate_tax} 
  end

  def receipt
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
    calculate_total * tax_rate
  end
end

