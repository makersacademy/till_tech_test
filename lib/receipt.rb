class Receipt

  attr_reader :order

  def initialize(order)
    @order = order || []
  end

  def show_breakdown
    order
  end

end