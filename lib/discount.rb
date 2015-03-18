require './lib/modules/percentage'

class Discount 
  attr_reader :discount, :description
  include Percentage

  def initialize options
    @discount               = options[:discount]
    @discountable_evaluator = options[:discountable?]
    @description            = options[:description]
  end

  def total amount
    calculate_discount amount 
  end

  def print amount 
    {total: total(amount), discount: @discount, description: description }
  end

  def calculate_discount amount
    (0 - (@discount.percent_of(amount))).round(2) if discountable? amount
  end

  def discountable? amount
    @discountable_evaluator.call(amount)
  end
  
end


