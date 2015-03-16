require 'calculator'

class Receipt

  include Calculator

  attr_reader :order

  def initialize(order)
    @order = order || []
  end

  def list_items
    order.items.uniq.each {|item| item}.join("\n")
  end

  def displays_info
    puts "#{list_items}\nSubtotal: #{subtotal}\nTax: #{calculate_tax}\nTotal: #{total}"
  end

end