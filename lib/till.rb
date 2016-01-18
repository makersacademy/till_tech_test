class Till
  attr_reader :prices
  def initialize(read_json_klass, file_klass, json_klass, filename, calculate_total_klass, receipt_printer_klass)
    @restaurant_data = read_json_klass.parse(file_klass, json_klass, filename)
    @calculate_total_klass = calculate_total_klass
    @receipt_printer_klass = receipt_printer_klass
    @prices = @restaurant_data[:prices]
  end

  def print_receipt(order)
    totals = @calculate_total_klass.run(@prices, order)
    @receipt_printer_klass.run(@restaurant_data, totals)
  end
end
