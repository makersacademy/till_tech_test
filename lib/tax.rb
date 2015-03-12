class Tax
  attr_reader :tax_rate

  def initialize tax_rate 
    @tax_rate = tax_rate
  end

  def total value
    value * (1 * tax_rate.to_f/100.0) 
  end

  def print value
    { total: total(value).round(2), tax: tax_rate }
  end
end
