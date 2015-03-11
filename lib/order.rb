class Order
  attr_reader   :name
  attr_accessor :cost, :discount
  
  def initialize(options = {})
    @name     = options[:name] 
    @cost     = options[:cost]
    @discount = "0%"
  end

  def cost 
    @cost * discount_multiplier
  end

  def discount_multiplier
   1-(discount.to_f/100)
  end
 

end

