class Tax
  attr_reader :tax_rate

  def initialize tax_rate 
    @tax_rate = tax_rate
  end

  def total value
    tax_rate.percent_of value 
  end

  def total_after_tax value
    (tax_rate.percent_of value) + value
  end

  def print value
    { total: total(value).round(2), tax_rate: tax_rate,
      total_after_tax: total_after_tax(value).round(2) }
  end
end
