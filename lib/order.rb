class Order

  attr_reader :order

  def initialize(hash,table)
    @order = hash
    @table = table
  end

  def count_items
    @order.reduce(0){|sum,(item,count)| sum+=count}
  end

  def total_sum
    @order.reduce(0){|sum,(item,count)| sum+=count*item.price}.round(2)
  end

  def items_sum
    result ={}
    @order.each do |item,count| 
      result[item]=count*item.price
    end
    result
  end


end