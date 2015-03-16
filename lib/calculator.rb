module Calculator

  def subtotal
    cost = 0
    order.contents.uniq.each {|item| cost += order.number_of(item)*item.price}
    cost
  end

  def calculate_tax
    ("%.2f" % (subtotal * 8.64/100)).to_f
  end

end