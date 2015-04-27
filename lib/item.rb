class Item
  
  attr_reader :name,:price

  def initialize(params = {})
    @name = params.fetch(:name,'caffee')
    @price = params.fetch(:price,2.99)
  end

end