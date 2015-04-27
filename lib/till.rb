require 'product_loader'

class Till

  TAX=0.0864

  attr_accessor :total

  def initialize
    @total = 0
  end

  def order product
    if product == :latte then
      4.75
    elsif
      product == :americano
       3.75
    end
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