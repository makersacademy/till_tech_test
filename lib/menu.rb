require 'json'
require 'date'


class Menu

     attr_accessor :customer_bill, :customer_order, :taxes, :sum, :amount, :array_m
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
       @array_m = []
       @array_m1 = []
       @arram = []

  end

   def showmenu
   puts "Welcome to our cafe! Please choose something to order!"
   puts "------------------------------------------------------"
        @menu[0]["prices"][0].each do |key, value|
   puts "Menu item:  #{key}  price: #{value} £"
end
   puts "------------------------------------------------------"
end


def showmenulist
      @menu[0]["prices"][0].each{|key, value| @array_m1.push("Menu item : #{key} price : #{value}£")}
      return @array_m1
end


  def order(booking, quantity)
          @menu[0]["prices"][0].select do |key,value|
       if booking == key and booking.include?'Muffin'
          @customer_order.push key => value * quantity * 0.9
          ord = "Ordered item:  #{key} , quantity: #{quantity}, price: #{value} £, sum #{value * quantity * 0.9} £ "
          @array_m.push(ord)
       elsif booking == key and !booking.include?'Muffin'
          @customer_order.push key => value * quantity
          ord = "Ordered item:  #{key} , quantity: #{quantity}, price: #{value} £, sum #{value * quantity} £ "
          @array_m.push(ord)
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

  def money(amount)
    if amount > @sum
     @amount = amount
   else
     puts "Transaction will not be made, not enough money"
     @amount = "Transaction will not be made, not enough money"
   end
  end

  def charge
     @charge = (@amount - @sum).round(2)
  end

  def current_time
      time = Time.new
      values = time.to_a
      Time.utc(*values)
  end

  def total_bill
      puts "************************************************"
      puts current_time
      puts "------------------------------------------------"
      puts          "Welcome to our Hipstercofee!"
      puts "The list of your purchase without any discount :"
      puts  @array_m
      puts "------------------------------------------------"
      puts "Total : #{@sum} £, taxes : #{@taxes} £          "
      puts "------------------------------------------------"
      puts "Discount : #{@discount} £"
      puts "You gave us #{@amount} £; charge #{@charge} £   "
      puts "________________________________________________"
      puts "Company: #{ @menu[0]["shopName"]}"
      puts "Addres:  #{ @menu[0]["address"]}"
      puts "Phone:   #{ @menu[0]["phone"]}"
      puts
  end


  def total_bill_show

    @arram = ["************************************************",
      current_time,
              "------------------------------------------------",
              "           Welcome to our Hipstercofee!         ",
              "The list of your purchase without any discount :",
              "------------------------------------------------",
              "Total : #{@sum} £, taxes : #{@taxes} £          ",
              "------------------------------------------------",
              "Discount : #{@discount} £",
              "------------------------------------------------",
              "Company: #{ @menu[0]["shopName"]}"               ,
              "Addres:  #{ @menu[0]["address"]}"                ,
              "Phone:   #{ @menu[0]["phone"]}"                  ,
              " ******* Thank you for you purchas**************"]
  end


end
