require_relative 'menu'

class Order

  attr_reader :complete_order, :menu

  def initialize
    @menu = Menu.new
    @complete_order = {}
  end

  def add(item)
    fail "Not on menu" unless menu.menu_list.key?(item)
    complete_order << item
  end

  def display_menu
    menu.menu_list.each { |key, value| puts "#{key} - £#{value}" }
  end

  def receipt
    order.map do |dish, quantity|
      "#{quantity}x #{dish} - £#{menu.menu_list[dish] * quantity}"
    end.join(', ')
  end

end
