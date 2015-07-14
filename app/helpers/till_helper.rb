require 'json'

module TillHelper

  class Till

    TAXRATE = 8.64
    MUFFIN_DISCOUNT = 10
    BULK = 50
    BULK_DISCOUNT = 5

    attr_reader :order

    def initialize
      @order = []
      file = open('./app/assets/javascripts/hipstercoffee.json')
      json = file.read
      @items = JSON.parse(json).first
      file.close
    end

    def print_receipt
      print_header
      print_items
      print_discounts
      print_totals
    end

    def print_header
      @receipt = [Time.now.strftime("%Y.%m.%d %H:%M:%S")]
      @receipt.push(search('shopName'))
      @receipt.push(search('address'))
      @receipt.push('phone: ' + search('phone'))
    end

    def print_items
      @order.uniq.each do |item|
        quantity = @order.count(item)
        line = item + " #{quantity}x £" + format('%.2f', search_for_price(item))
        @receipt.push(line)
      end
    end

    def print_discounts
      if @order.count { |i| i =~ /Muffin/ } > 0
        @receipt.push("10% Muffin Discount: -£#{muffin_discount}")
      end
      return unless total_cost > BULK
      @receipt.push("5% Discount: -£#{bulk_discount}")
    end

    def print_totals
      @receipt.push("Tax: £#{tax}")
      total = total_cost - (muffin_discount + bulk_discount)
      @receipt.push('Total: £' + format('%.2f', total))
    end

    def search(item)
      @items.fetch(item)
    end

    def search_for_price(item)
      prices = @items.fetch('prices').first
      prices.fetch(item)
    end

    def add_item(item, quantity)
      quantity.times { @order.push(item) }
    end

    def calculate_subtotal
      subtotal = []
      @order.each { |item| subtotal << search_for_price(item) }
      subtotal
    end

    def tax
      format('%.2f', (total_cost.to_f / 100) * TAXRATE)
    end

    def total_cost
      calculate_subtotal.inject(0) { |sum, value| sum += value }.round(2)
    end

    def pay(amount)
      print_receipt
      return unless amount >= total_cost
      change = format('%.2f', (amount - total_cost))
      amount = format('%.2f', amount)
      @receipt.push("Cash: £#{amount}")
      @receipt.push("Change: £#{change}")
    end

    def muffin_discount
      quantity = @order.count { |i| i =~ /Muffin/ }
      subtotal = search_for_price('Blueberry Muffin') * quantity
      ((subtotal / 100) * MUFFIN_DISCOUNT).round(2)
    end

    def bulk_discount
      return 0 unless total_cost > BULK
      ((total_cost / 100) * BULK_DISCOUNT).round(2)
    end

  end

end
