class TaxCalculator
  TAX_RATE = 0.0864
  def self.calculate_tax order
    (order.total * TAX_RATE).round(2)
  end
end