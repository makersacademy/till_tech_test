class Order

  attr_reader :contents

  def initialize(*args)
    @contents = args.to_a
  end

  def number_of(product)
    count = 0
    contents.each {|item| count +=1 if item == product }
    count
  end

end