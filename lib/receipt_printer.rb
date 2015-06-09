class ReceiptPrinter

  PRICE_LIST = { cappucino: 3.85, cortado: 4.55 }
  def self.print order
    if order.empty?
      return "This is an eerily empty receipt. Order something next time, please!"
    else
      printed_items = order.items.map do |item, quantity|
        "#{item.capitalize} #{quantity} x #{PRICE_LIST[item]}"
      end.join("\n")
      printed_items += "\nTax $#{TaxCalculator.calculate_tax order}\n"
      printed_items += "Total $#{TotalCalculator.calculate_total order}"
    end
  end

end