class Tax
  attr_reader :tax_rate

  def initialize tax_rate 
    @tax_rate = tax_rate
  end

  def total value
    (value * (1 * tax_rate.to_f/100.0))
  end

  def total_after_tax value
    (value * (1 + tax_rate.to_f/100.0)).round(2)
  end

  def print value
    { total: total(value).round(2), tax_rate: tax_rate,
      total_after_tax: total_after_tax(value) }
  end
end
