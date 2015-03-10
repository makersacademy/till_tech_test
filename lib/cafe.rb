
class Cafe

  def initialize options = {}
    @name = options[:name]
    @tax  = options[:tax]
  end
  
  def calculate(value)
    value * @tax 
  end

end

