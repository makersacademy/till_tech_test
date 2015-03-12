class Receipt
  attr_reader :orders, :location
  attr_accessor :evaluators

  def initialize orders, options = {} 
    @orders       = orders 
    @evaluators   = options
  end

  def print 
    orders.print.merge(
      @evaluators.map {|key, eval| [key, eval.print(orders.total)] }.to_h 
    )
  end

end

