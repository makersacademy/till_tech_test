require 'menu'

class Till

  include Menu

  def initialize
    load_price_list
  end

end