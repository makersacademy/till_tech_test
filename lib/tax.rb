class Tax
  attr_reader :tax_rate

  def initialize tax_rate 
    @tax_rate = tax_rate
  end

  def total value
    value * (1 - tax_rate.to_f/100) 
  end

  def print value
    { total_after_tax: total(value), tax: tax_rate }
  end
end
