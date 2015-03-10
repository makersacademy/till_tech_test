
class Cafe

  def initialize options = {}
    @name = options[:name]
    @tax  = options[:tax]
  end
  
  def calculate(value)
    { after_tax: value * @tax }
  end

end

