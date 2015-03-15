def order_list
  @order_list ||= OrderList.new
end

def receipt evaluator_objects = {}
  @receipt    ||= Receipt.new(order_list, evaluator_objects)
end

def menu
  @menu ||= Menu.new(spaghetti: {name: 'Spaghetti', price: 5.0 })
end

def order=(order_details)
  @order = Order.new(order_details)
end

def order
  @order
end


