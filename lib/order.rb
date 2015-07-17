class Order
  TAX = 8.64

  attr_accessor :lines, :total

  def initialize
    @lines = []
    @total = 0
  end

  def add(line)
    lines.push(line)
  end

  def total_no_tax
    line_totals = lines.map { |line| line[1] * line[2] }
    line_totals.inject(:+)
  end

  def total_with_tax
    (total_no_tax * (100 + TAX) / 100).round(2)
  end

  def finish # builder pattern / finish not required
    @total = total_with_tax
  end

  def print # do no puts, save to variable and return
    output = ''
    lines.each do |line|
      output << "#{line[0]} - #{line[1]} x #{line[2]}\n"
    end
    output << "Tax: #{(total_no_tax * 8.64 / 100).round(2)}\n"
    output << "Total #{total_with_tax}"
    output
  end
end
