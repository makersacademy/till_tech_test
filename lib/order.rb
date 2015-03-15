class Order

  attr_reader :current

  def initialize
    @current = []
  end

  def add item, quantity
    current.push({item: item, quantity: quantity})
  end
end