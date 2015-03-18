require 'order'
require 'calculator'

class Till

  initialize(order, calculator)
    @order = Order.new
    @calculator = Calculator.new
  end

end