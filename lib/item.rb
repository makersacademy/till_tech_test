class Item

attr_accessor :name, :price

def initialize(name, price)
  @name = name
  @price = price
end

# def muffin_discount
#   if self.name.include("Muffin")
#     self.price = self.price * 0.9
#   end
# end

end