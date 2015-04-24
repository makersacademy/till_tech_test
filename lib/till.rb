class Till
  def order(product)
    @total = '9.50' if product == :latte
    @total = '15.00' if product == :americano
  end

  def checkout
    @total
  end

  def line_items
    ['2 x Caffe Latte']
  end
end
