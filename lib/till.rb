require 'product_loader'

class Till
  include Product_list

  TAX=0.0864

  attr_accessor :total, :tax_total, :ordered_items

  def initialize
    @total = 0
    @tax_total = 0
    @ordered_items = {}
    super
  end

  def product_price product
    data_hash[0]['prices'][0][product]
  end

  def line_order product, quantity
    total = line_total(product, quantity)
    @ordered_items[product.to_sym] = {total: total, quantity: quantity}
  end

  def line_total product, quantity
    product_price(product) * quantity
  end

  def calculate_tax total
    @tax_total = (total * TAX).round(2)
  end

  def sale
    pre_tax_total
    calculate_tax(@total)
    @total += @tax_total
  end

  def pre_tax_total
    @ordered_items.each do |key, value|
      value.each {|key, value| @total += value if key == :total}
    end
  end

  def create_receipt receipt
    make_receipt = receipt.new
    make_receipt.customer_receipt(total, tax_total ,ordered_items)
  end

end
