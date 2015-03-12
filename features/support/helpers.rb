def order_list
  @order_list ||= OrderList.new
end

def receipt
  @receipt    ||= Receipt.new(order_list)
end

