
class Cafe
  attr_reader :tax

  def initialize options = {}
    @name = options[:name]
    @tax  = options[:tax]
  end
  
  def calculate_tax(value)
    value * @tax.to_f/100
  end

end

