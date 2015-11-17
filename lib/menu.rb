require 'json'

class Menu

  attr_accessor :customer_bill, :customer_order, :taxes, :sum
  attr_reader :menu

  def initialize
    file = open("hipstercoffee.json")
    json = file.read
    @menu = JSON.parse(json)
    @customer_order = []
    @customer_bill = []
    @total = 0
    @taxes = 0
  end

  def order(booking)
    @menu[0]["prices"][0].select do |key,value|
      if booking == key
        @customer_order.push key => value
      end
    end
  end

  def prices
    @customer_order.each do |hash|
      @customer_bill << hash.values[0]
    end
    @customer_bill
  end


  def sum
    sum_bill = @customer_bill.inject(0) { |result, element| result + element }
    @sum = sum_bill
  end

  def taxes
    sum = self.sum
    taxes = sum * 0.0864
    @taxes = taxes.round(2)
  end

end
