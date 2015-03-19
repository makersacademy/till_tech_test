require "./lib/modules/percentage"

class Order
  attr_reader   :name, :cost
  attr_accessor :price, :discount
  
  def initialize(options = {})
    @name     = options[:name] 
    @price    = options[:price]
    @discount = options[:discount]
  end

  def cost 
    @discount ? @price - (@discount.percent_of @price) : @price
  end

  def print value=nil
    { name: name, price: price.round(2), cost: (cost).round(2), discount: discount } 
  end

end

