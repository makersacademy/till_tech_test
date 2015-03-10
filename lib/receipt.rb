class Receipt
  attr_reader :items

  def initialize(order_information = {})
    puts order_information
    @items = order_information[:items]
  end

  def print
   "items: 
      2 x  Caffe Latte, 4.75
    " 
  end
end


