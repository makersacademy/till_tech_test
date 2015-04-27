class Order
  attr_reader :products

  def initialize
    @products = []
  end

  def add(product, quantity = 1)
    quantity.times { products << product }
  end
end
