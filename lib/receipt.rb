require 'byebug'
class Receipt
  attr_reader :orders, :location
  attr_accessor :evaluators

  def initialize orders, options = {} 
    @orders       = orders 
    @evaluators   = options
  end

  def print 
    receipt_elements = orders.print.merge(run_and_print_calculations)
    receipt_elements.merge total(receipt_elements)
  end

  def run_and_print_calculations 
    @evaluators.map {|key, eval| [key, eval.print(orders.total)] }.to_h 
  end

  def total receipt_elements
    {total: receipt_elements.values.inject(0) {|memo, hash| memo + (hash[:total] || 0 )}}
  end

end

