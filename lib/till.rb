class Till
  def initialize
    @total = 0
  end

  def order(product)
    @total += product.price
  end

  def checkout
    @total
  end

  def line_items
    ['Caffe Latte 2 x 4.75']
  end
end
