class Order
  attr_reader   :name, :cost
  attr_accessor :price, :discount
  
  def initialize(options = {})
    @name     = options[:name] 
    @price    = options[:price]
    @discount = options[:discount] 
  end

  def cost 
    @price * discount_multiplier
  end

  def discount_multiplier
   1-(discount.to_f/100)
  end
 

end

