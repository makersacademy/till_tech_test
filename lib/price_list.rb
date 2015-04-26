require_relative 'product'

class PriceList
  attr_reader :products

  def initialize
    @products = []
  end

  def add(product)
    products << product
  end

  def remove(product)
    products.delete(product)
  end

  def cost(name)
    (products.find { |product| product.name == name }).price
  end

  def read_file(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    list = data_hash[0]['prices']
    list[0].each do |name, price|
      products << Product.new(name, price)
    end
  end
end
