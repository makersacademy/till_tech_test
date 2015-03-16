module Calculator

  def subtotal
    cost = 0
    order.contents.uniq.each {|item| cost += order.number_of(item)*item.price}
    cost
  end

  def calculate_tax

  end

end