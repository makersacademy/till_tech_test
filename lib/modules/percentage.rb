module Percentage 
  def percent_of(value) 
    (self.to_f/100) * value
  end

end

class String
  include Percentage 
end

class Numeric
  include Percentage
end

