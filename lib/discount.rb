
class Discount 
  attr_reader :discount

  def initialize options
    @discount               = options[:discount]
    @discountable_evaluator = options[:discountable?]
  end

  def total amount
    -3.5 
  end




end
