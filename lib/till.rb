require 'json'

class Till

  attr_accessor :customer_order
  attr_accessor :receipt
  attr_accessor :customer_bill
  attr_accessor :tax
  attr_accessor :total
  attr_reader :menu
  
  def initialize 
    file = open("hipstercoffee.json")
    json = file.read   
    @menu = JSON.parse(json)  
    @customer_order = []
    @customer_bill = []
    @receipt = []
    @total = 0
    @tax = 0
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


  def totals
    total_bill = @customer_bill.inject(0) { |result, element| result + element }
    @total = total_bill
    tax = @total * 0.0864
    @tax = tax.round(2)
  end

  def print_receipt
    @customer_order.each do |hash|
      @receipt.push hash
    end

    tax = {}
    total = {}

    tax["Tax"] = @tax    
    total["Total"] = @total

    @receipt.push tax, total
  end
end