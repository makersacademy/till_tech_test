require './lib/modules/percentage'

class Discount 
  attr_reader :discount
  include Percentage

  def initialize options
    @discount               = options[:discount]
    @discountable_evaluator = options[:discountable?]
  end

  def total amount
    calculate_discount amount 
  end

  def calculate_discount amount
    0 - (@discount.percent_of(amount)) if discountable? amount
  end

  def discountable? amount
    @discountable_evaluator.call(amount)
  end

  
end


