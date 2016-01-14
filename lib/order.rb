class Order
  def initialize
    @current_order = {}
  end

  def add(order_item, quantity = 1)
    if @current_order[order_item]
      @current_order[order_item] += quantity
    else
      @current_order[order_item] = quantity
    end
  end

  def check_order
    @current_order
  end

end
