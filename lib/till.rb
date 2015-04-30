require_relative 'product_list'

class Till
  include ProductList

  TAX=0.0864

  attr_reader :total, :tax_total, :ordered_items

  def initialize receipt
    super()
    @receipt = receipt
    @total = 0
    @tax_total = 0
    @ordered_items = {}
  end

  def product_price product
    data_hash[0]['prices'][0][product]
  end

  def line_order product, quantity
    calc_total = line_total(product, quantity)
    @ordered_items[product.to_sym] = {total: calc_total, quantity: quantity}
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

  def create_receipt
    sale
    make_receipt = @receipt.new
    make_receipt.customer_receipt(@total, @tax_total ,@ordered_items)
  end
end
