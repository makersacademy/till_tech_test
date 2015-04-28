require 'product_loader'
require 'json'

class Till
  include Product_list
  TAX=0.0864

  attr_accessor :total

  def initialize
    @total = 0
    super
  end

  def order product
    data_hash[0]['prices'][0][product]
  end

  def line_order product, quantity
    @total += order(product) * quantity
  end

  def calculate_tax total
    (total * TAX).round(2)
  end

  def sale
    @total + calculate_tax(@total)
  end

end