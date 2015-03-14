
class Discount 
  attr_reader :discount

  def initialize options
    @discount               = options[:discount]
    @discountable_evaluator = options[:discountable?]
  end

  def total amount
    calculate_discount amount 
  end

  def calculate_discount amount
    0 - ((@discount.to_f/100) * amount) if discountable? amount
  end

  def discountable? amount
    @discountable_evaluator.call(amount)
  end


end
