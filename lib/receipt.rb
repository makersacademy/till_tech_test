class Receipt

  attr_reader :order

  def initialize(order)
    @order = order || []
  end



end