class Order
attr_accessor :lines, :total

  def initialize
    @lines = []
    @total = 0
  end

  def add(line)
    lines.push(line)
  end

  def totalNoTax
    lineTotals = self.lines.map {|line| line[1]* line[2]}
    lineTotals.inject(:+)
  end

  def totalWithTax
    (totalNoTax * (100 + TAX)/ 100).round(2)
  end

  def finish
    @total = totalWithTax
  end

  def print
    self.lines.each do |line|
      puts "#{line[0]} - #{line[1]} x #{line[2]}\n"
    end
    puts "Tax: #{(self.totalNoTax * 8.64/100).round(2)}\n"
    puts "Total #{self.totalWithTax}"

  end
end
