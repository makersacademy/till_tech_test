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
    { items: itemized_list, items_total: total }  
  end

  def total
    orders.inject(0) {|sum, order| sum + order.cost }
  end
  
  def itemized_list 
    orders.map do |order|
      {name: order.name, quantity: orders.select {|ord| ord.name == order.name}.count,
       cost: order.cost * orders.select {|ord| ord.name == order.name}.count }
    end.uniq
  end
 
end


