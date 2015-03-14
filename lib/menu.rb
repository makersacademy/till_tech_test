require './lib/order'

class Menu
  attr_reader :items

  def initialize items = {}
    @items = items
  end

  def order item_name
    unless items[item_name] 
      raise "'#{item_name.to_s.capitalize}' is not on the menu" 
    end
    
    items[item_name] 
  end

end

