require 'transaction'
require 'json'

class Till

  def initialize
    @price = load_item_prices
    new_transaction
  end

  attr_reader :transaction
  attr_accessor :price

  def new_transaction
    @transaction = Transaction.new
  end

  def current_transaction
    transaction
  end

  def add_item(item, quantity=1)
    quantity.times {current_transaction.add(price[item])}
  end

  def load_item_prices
    file = File.read('hipstercoffee.json')
    hash = JSON.parse(file).first
    hash['prices'].first
  end

end
