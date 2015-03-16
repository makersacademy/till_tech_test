class Payment

  def calculate_change(total_due, tendered)
    (tendered - total_due).round(2)
  end
end