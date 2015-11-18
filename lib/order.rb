require_relative 'menu'

class Order

  attr_reader :complete_order, :menu, :order_total

  def initialize
    @menu = Menu.new
    @complete_order = {}
    @order_total = 0
  end

  def add(item, quantity)
    fail "Not on menu" unless menu.menu_list.key?(item)
    update_price(item, quantity)
    add_to_order(item, quantity)
  end

  def display_menu
    menu.menu_list.each { |key, value| puts "#{key} - £#{value}" }
  end

  def receipt
    complete_order.map do |item, quantity|
      "#{quantity}x #{item} - £#{menu.menu_list[item] * quantity}"
    end.join("\n")
  end

  def tax_receipt
    return receipt + "\nTax @8.64%      £#{(order_total * 0.0867).round(2)} \nTotal           £#{order_total + (order_total * 0.0867).round(2)}"
  end

  private

  def update_price(item, quantity)
    @order_total += menu.menu_list[item] * quantity
  end

  def add_to_order(item, quantity)
    @complete_order[item] = quantity
  end

end
