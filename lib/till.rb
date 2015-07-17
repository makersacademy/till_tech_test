require 'json'
require_relative 'order'

TAX = 8.64

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

  def print_prices
    self.prices.each { |k, v| puts "#{k}: #{v}" }
  end

  def new_order
    @current_order = Order.new # refactor dependency injection
  end

  def add_item(item, quantity)
    price = self.prices[item]
    self.current_order.add([item, quantity, price])
  end

  def finish_order
    self.current_order.finish
    self.current_order.print
    self.orders.push self.current_order
    self.new_order
  end

end
