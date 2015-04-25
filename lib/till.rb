class Till

  def order(product)
    @total = '4.75' if product == :latte 
  end

  def checkout
    @total
  end

end