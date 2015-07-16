require 'json'

class Till

  attr_accessor :customer_order
  attr_reader :menu
  attr_accessor :customer_bill

  def initialize 
    file = open("hipstercoffee.json")
    json = file.read   
    @menu = JSON.parse(json)  
    @customer_order = []
    @customer_bill = []
  end

  def place_order(choice)
      @menu[0]["prices"][0].select do |key,value|
        if choice == key
          @customer_order.push key => value
        end
      end
  end

  def checkout
    @customer_order.each do |hash|
      @customer_bill << hash.values[0]
    end
    @customer_bill
  end

  def print_receipt
    @customer_order
  end
end