class Order
  attr_reader   :name
  attr_accessor :price, :discount
  
  def initialize(name)
    @name     = name 
    @discount = "0%"
  end

  def price 
    @price * (1-(discount.to_f/100))
  end

end

