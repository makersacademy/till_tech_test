module Receipt

  def print_receipt_head(shop_details)
    receipt_header = [time_and_date]
    shop_details.each { |detail| receipt_header << detail }
    receipt_header
  end

  def print_receipt_body(order)
    receipt_body = []
    order.each { |item, details| receipt_body << "#{item} #{details[0]} x $#{details[1].round(2)}" }
    receipt_body
  end

  def print_receipt_footer(order_list, adjustments, cash)
    receipt_footer = ["#{adjustments.item_on_discount} Discount 10% from $#{adjustments.item_discount_total(order_list)}", 
                      "Tax $#{tax_total(order_list, adjustments)}",
                      "Total $#{total_of(order_list, adjustments)}",
                      "Cash: $#{cash} ",
                      "Change: $#{calculate_change(cash, total_of(order_list, adjustments)).round(2)}"
                    ]
  end

  def time_and_date
    Time.now.strftime("%d/%m/%Y %H:%M")
  end

end