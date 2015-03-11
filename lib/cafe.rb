
class Cafe
  attr_reader :tax, :info

  def initialize options = {}
    @name = options[:name]
    @tax  = options[:tax]
    @info = options[:info]
  end
  
  def calculate_tax(value)
    value * @tax.to_f/100
  end

end

