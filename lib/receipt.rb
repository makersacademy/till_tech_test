class Receipt
  attr_accessor :line_items, :tax, :total

  def initialize
    @line_items = []
    @tax = ''
    @total = ''
  end

  def display
    receipt = []
    line_items.each { |line_item| receipt << line_item }
    receipt << 'Tax          £' + @tax
    receipt << 'Total        £' + @total
    receipt.flatten
  end

  def add_line(line)
    line_items << line
  end

  def add_total(amount)
    @total = (format '%.2f', amount)
  end

  def add_tax(amount)
    @tax = (format '%.2f', amount)
  end
end
