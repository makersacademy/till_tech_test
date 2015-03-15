require 'menu'

class Receipt

  include Menu

  attr_reader :order

  def initialize order
    @order = order
    load_price_list
  end

  def price_for item
    price_list[item]
  end

end