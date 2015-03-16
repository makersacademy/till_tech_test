
module KnowsTheDomain

  def order_list
    @order_list ||= Capybara.app.order_list 
  end

  def receipt evaluator_objects = {}
    @receipt    ||= Receipt.new(order_list, evaluator_objects)
  end

  def menu
    @menu ||= (Capybara.app.menu =  Menu.new([{ name: 'Spaghetti', price: 5.0 }]))
  end

  def order=(order_details)
    @order = Order.new(order_details)
  end

  def order
    @order
  end

  def create_order options
    Order.new(options)
  end

  def place_order options
    order_list.receive_order create_order(options)
  end

end

module KnowsTheUserInterface

  def order_list
    @order_list ||= Capybara.app.order_list
  end

end

