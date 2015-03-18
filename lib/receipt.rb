require 'calculator'

class Receipt

  attr_reader :order, :calculator

  def initialize(order)
    @order = order || []
  end

  def list_items
    order.items.uniq.each {|item| item}.join("\n")
  end

  def displays_info(subtotal, tax, total)
    puts "#{list_items}\nSubtotal: #{subtotal}\nTax: #{tax}\nTotal: #{total}"
  end

end