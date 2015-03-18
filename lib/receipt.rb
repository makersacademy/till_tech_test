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
    @evaluators.map { |key, eval| [key, eval.print(orders.total)] }.to_h 
  end

  def total receipt_elements
    grand_total = calculate_grand_total receipt_elements
    { total: grand_total.round(2) }
  end

  def calculate_grand_total receipt_elements
    receipt_elements.values.inject(0) do |memo, hash| 
      memo + (hash[:total] || 0 )
    end
  end



end

