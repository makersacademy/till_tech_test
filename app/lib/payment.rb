class Payment

  def payment_result(money_tendered, receipt_total)
    change = calculate_change(money_tendered, receipt_total)
    if  change >= 0
      "Change - #{change}"
    else
      "Amount tendered is #{change.abs} less than amount due"
    end
  end

  def calculate_change(money_tendered, receipt_total)
    (money_tendered - receipt_total).round(2)
  end

end
