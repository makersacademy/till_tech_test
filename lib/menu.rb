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
       @quantity = 1

  end

  def order(booking, quantity)
       @menu[0]["prices"][0].select do |key,value|
          if booking == key
       @customer_order.push key => value * quantity
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
      sum_bill = @customer_bill.inject(0) { |result, element| result + element}
      if sum_bill > 50
      sum_bill = sum_bill * 0.95
      @sum = sum_bill.round(2)
      else
      @sum = sum_bill.round(2)
      end
  end

  def taxes
      sum = self.sum
      taxes = sum * 0.0864
      @taxes = taxes.round(2)
  end

  def discount
     sum = self.sum
     without_discount = @customer_bill.inject(0) { |result, element| result + element}
     @discount = (without_discount - sum).round(2)
  end



end
