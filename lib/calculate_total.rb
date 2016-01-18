class CalculateTotal
  TAX = 0.0864

  def self.run(prices, order)
    CalculateTotal.new(prices,order).run
  end

  def initialize(prices, order)
    @prices = prices
    @current_order = order.check_order
  end

  def run
    {subtotal: subtotal, tax: tax, total: total}
  end

  private
  def subtotal
    @current_order.map{|menu_item, quantity| [menu_item, "#{quantity} x $#{two_dp_string(quantity * @prices[menu_item])}"]}.to_h
  end

  def tax
    "$" + two_dp_string(pre_tax_total * TAX)
  end

  def total
    "$" + two_dp_string(pre_tax_total + tax[1..-1].to_f)
  end

  def subtotal_values
    @current_order.map{|menu_item, quantity| [menu_item, quantity * @prices[menu_item]]}.to_h
  end

  def pre_tax_total
    subtotal_values.map{|key, value| value}.inject(:+)
  end

  def two_dp_string(float)
    '%.2f' % float
  end
end
