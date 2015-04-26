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
      item_cost = product.price if product.name == name
    end
    item_cost
  end

  def read_file(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    list = data_hash[0]["prices"]
    list[0].each do |key, value|
      @products << Product.new(key,value)
    end
  end
end
