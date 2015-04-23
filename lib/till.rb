class Till

  def order item
    @total = 9.50 if item == :latte
    @total = 15.00 if item == :americano
  end

  def cash_out
    @total
  end
end