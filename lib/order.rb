class Order

  attr_accessor :lines, :total

  def initialize
    @lines = []
    @total = 0
  end

  def add(line)
    lines.push(line)
  end

  def total_no_tax
    line_totals = self.lines.map { |line| line[1] * line[2] }
    line_totals.inject(:+)
  end

  def total_with_tax
    (total_no_tax * (100 + TAX) / 100).round(2)
  end

  def finish
    @total = total_with_tax
  end

  def print
    self.lines.each do |line|
      puts "#{line[0]} - #{line[1]} x #{line[2]}\n"
    end
    puts "Tax: #{(self.total_no_tax * 8.64 / 100).round(2)}\n"
    puts "Total #{self.total_with_tax}"
  end

end
