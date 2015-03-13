require 'byebug'
class OrderList 
  attr_reader :orders

  def initialize 
    @orders = []
  end

  def receive_order(order)
    orders.push order
    self
  end

  def print value=nil
    { order: { items: itemized_list, total: total }}
  end

  def total
    orders.inject(0) {|sum, order| sum + order.cost }
  end
  
  def itemized_list 
    condense orders.map(&:print)
  end

  def condense order_hashes
    order_hashes = condense_by_quantity order_hashes
    order_hashes = recalculate_cost     order_hashes
    order_hashes
  end

  def condense_by_quantity order_hashes
    order_hashes.map do |order|
      order[:quantity] = order_hashes.count {|ord| order[:name] == ord[:name] }
      order
    end.uniq
  end

  def recalculate_cost order_hashes
    order_hashes.map {|order| order[:cost] *= order[:quantity] } 
    order_hashes
  end
 
end


