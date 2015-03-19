require "./lib/order"

class Menu
  attr_reader :items

  def initialize items = [] 
    @items = items
  end

  def order item_name
    unless items.select {|item| item[:name] == item_name }.sample
      raise "'#{item_name.to_s.capitalize}' is not on the menu" 
    end
   
    items.select {|item| item[:name] == item_name }.sample
  end

end

