require 'json'
require_relative 'order'

class Till

  attr_reader :shop_name, :address, :phone, :prices, :orders, :current_order

  def initialize
    file = File.read('hipstercoffee.json')
    data = JSON.parse(file)
    @shop_name = data[0]['shop_name']
    @address = data[0]['address']
    @phone = data[0]['phone']
    @prices = data[0]['prices'][0]
    @orders = []
    @current_order = []
    self.new_order
  end

  def new_order
    @current_order = Order.new # refactor dependency injection
  end

  def add_item(item, quantity)
    price = prices[item]
    current_order.add([item, quantity, price])
  end

  def finish_order
    current_order.finish
    current_order.print
    orders.push current_order
    new_order
  end

end

# remove self
