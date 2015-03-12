class Receipt
  attr_reader :orders, :location

  def initialize orders, options = {} 
    @orders       = orders 
    @evaluators   = options
  end

  def print 
    orders.print.merge(
      @evaluators.values.inject({}) {|memo, eval| memo.merge(eval.print orders.total) }
    )
  end

end

