require 'json'
require_relative 'order'

class Till
  attr_reader :shopName, :address, :phone, :prices, :orders, :currentOrder

  def initialize
    file = File.read('hipstercoffee.json')
    data = JSON.parse(file)
    @shopName = data[0]['shopName']
    @address = data[0]['address']
    @phone = data[0]['phone']
    @prices = data[0]['prices'][0]
    @orders = []
    @currentOrder = []
  end

  def printPrices
    self.prices.each {|k,v| puts "#{k}: #{v}"}
  end

  def newOrder
    @currentOrder = Order.new # refactor dependency injection
  end

  def addItem(item, quantity)
    price = self.prices[item]
    self.currentOrder.add([item,quantity,price])
  end
end
