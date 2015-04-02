class Receipt

  def initialize(order, tax)
    @tax = tax
    @order = order
  end

  def print_receipt_head(shop_details)
    receipt_header = [time_and_date]
    shop_details.each { |detail| receipt_header << detail }
    receipt_header
  end

  def print_receipt_body
    receipt_body = []
    @order.each do |item, details|
      receipt_body << "#{item} x #{details[0]} = $#{details[1].round(2)}"
    end
    receipt_body
  end

  def print_change(calculate_change)
    calculate_change
  end

  def print_receipt_footer(tax_total, total, adjustments, cash)
    ["#{adjustments.item_on_discount} Discount 10% from $#{adjustments.item_discount_total(@order).round(2)}",
     "Tax $#{tax_total}",
     "Total $#{total}",
     "Cash: $#{cash} ",
     "Change: $#{calculate_change(cash, total).round(2)}"
    ]
  end

  def time_and_date
    Time.now.strftime("%d/%m/%Y %H:%M")
  end
end
