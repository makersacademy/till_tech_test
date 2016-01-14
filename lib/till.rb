require_relative 'list'

class Till

    attr_reader :list, :order, :order_value

    def initialize
      @list = List.new
      @order = {}
      @order_value = 0
    end

    def add(item, quantity)
      fail "Not on menu" unless list.items.key?(item)
      add_to_order(item, quantity)
      update_price(item, quantity)
    end

    def display_list
      list.items.each { |key, value| puts "#{key} - £#{value}" }
    end

    def bill
      order.map do |item, quantity|
        "#{quantity}x #{item} - £#{list.items[item] * quantity}"
      end.join("\n")
    end

    def tax
      "Tax @8.64%      £#{(order_value * 0.0867).round(2)} \n"
    end

    def total
      "Total           £#{order_value + (order_value * 0.0867).round(2)}"
    end

    def change(amount)
      return "£#{(amount - (order_value + (order_value * 0.0867))).round(2)}"
    end

    def final_bill(amount)
      puts bill
      puts tax
      puts total
      puts "Change  - " + change(amount)
    end

    private

    def update_price(item, quantity)
      @order_value += list.items[item] * quantity
    end

    def add_to_order(item, quantity)
      @order[item] = quantity
    end

end
