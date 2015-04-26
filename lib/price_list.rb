require_relative 'product'

class PriceList
  attr_reader :products

  def initialize
    @products = []
  end

  def add(product)
    @products << product
  end

  def remove(product)
    @products.delete(product)
  end

  def cost(name)
    item_cost = nil
    @products.each do |product|
      if product.name == name
        item_cost = product.price
      end
    end
    item_cost
  end
end
