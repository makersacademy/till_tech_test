class Receipt
  attr_reader :order_info 

  def initialize(order_info)
    @order_info = order_info
  end

  def print
    "You ordered:\n" + 
     itemized_list + "\n" + 
     "sub-total: #{order_info[:subtotal]}" + "\n" + 
     "tax: #{order_info[:tax].to_s}" + "\n" +
     "total: #{order_info[:total].to_s}"
  end

  def itemized_list
    output = ""
    self.order_info[:orders].each do |order|
      output << "#{order.name} X #{order.quantity}, #{order.cost}"
    end
    output
  end
end


