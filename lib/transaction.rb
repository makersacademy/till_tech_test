class Transaction

  def initialize
    @subtotal = 0
  end

  attr_accessor :subtotal

  def add(price)
    self.subtotal += price
  end

end
