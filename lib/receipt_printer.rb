class ReceiptPrinter
  def initialize(restaurant_data, totals)
    @restaurant_data = restaurant_data
    @totals = totals
  end

  def self.run(restaurant_data, totals)
    self.new(restaurant_data, totals).run
  end

  def run
    "#{header}\n#{subtotals}\n#{tax_and_total}"
  end

  def header
    "\
#{Time.new.strftime("%Y.%m.%d %H:%M:%S")}\n\
#{@restaurant_data["shopName"]}\n\
#{@restaurant_data["address"]}\n\
#{format_phone(@restaurant_data["phone"])}"
  end

  def subtotals
    "  #{format_subtotal}"
  end

  def tax_and_total
    "\
#{label_pad_value(:tax, @totals, TAX_TOTAL_PADDING)}\n\
#{label_pad_value(:total, @totals, TAX_TOTAL_PADDING)}"
  end

  private
  TAX_TOTAL_PADDING = 30
  SUBTOTAL_PADDING = 28

  def format_phone(phone_number)
    "Phone: +#{phone_number[0]} (#{phone_number[1..3]}) #{phone_number[4..6]}-#{phone_number[7..-1]}"
  end

  def format_subtotal
    @totals[:subtotal].map{|name, value| label_pad_value(name, @totals[:subtotal], SUBTOTAL_PADDING)}.join("\n  ")
  end

  def pad_item_name(name, value, padding)
    sym_to_string(name).ljust(padding - value.length)
  end

  def sym_to_string(sym)
    sym.to_s.split('_').map(&:capitalize).join(' ')
  end

  def label_pad_value(key, hash, padding)
    "#{pad_item_name(key, hash[key], padding)}#{hash[key]}"
  end
end
