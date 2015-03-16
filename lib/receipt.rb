require 'calculator'

class Receipt

  include Calculator

  attr_reader :order

  def initialize(order)
    @order = order || []
  end

  def list_items
    order.items.each {|item| item}
  end

  def displays_info
    puts list_items
    puts subtotal
    puts calculate_tax
    puts total
  end

end