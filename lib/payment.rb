
class Payment
  attr_reader :sum, :total_with_tax

  def initialize sum, total_with_tax=nil
    @sum = sum.to_f
    @total_with_tax = total_with_tax
  end

  def print total=nil
    total = total_with_tax || total
    { payment: sum, remaining_balance: calculate_remaining_balance(total),
      change: calculate_change(total) }
  end

  def calculate_remaining_balance total
    ((total - sum) > 0) ? total - sum : 0.0 
  end

  def calculate_change total
    ((sum - total) > 0) ? (sum - total) : 0.0
  end


end

