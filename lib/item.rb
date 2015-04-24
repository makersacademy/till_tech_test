class Item

  attr_accessor :name, :price

  def initialize(name_of_item, price=0)
    @name = name_of_item
    @price = price
  end
end