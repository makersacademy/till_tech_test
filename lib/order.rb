class Order

attr_accessor :orderLines

def initialize
  @orderLines = Array.new
end

def add(line)
  self.orderLines.push(line)
end
end
