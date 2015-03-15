
class Payment
  attr_reader :sum

  def initialize sum 
    @sum = sum.to_f
  end

  def print total=nil
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

