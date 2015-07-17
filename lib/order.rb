class Order
attr_accessor :orderLines

  def initialize
    @orderLines = []
  end

  def add(line)
    orderLines.push(line)
  end

  def totalNoTax
    lineTotals = self.orderLines.map {|line| line[1]* line[2]}
    lineTotals.inject(:+)
  end
end
