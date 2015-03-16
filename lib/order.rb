class Order

  attr_reader :contents

  def initialize(*items)
    @contents = items.to_a
  end

  def items
    list = []
    contents.each{|item| list << "#{item.name}: #{self.number_of(item)} x #{item.price}"}
    list
  end

  def number_of(product)
    count = 0
    contents.each {|item| count +=1 if item == product }
    count
  end

end