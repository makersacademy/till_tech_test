class Order

  attr_reader :current

  def initialize
    @current = []
  end

  def add item, quantity=1
    current.push({item: item, quantity: quantity})
  end
end