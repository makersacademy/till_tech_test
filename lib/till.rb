require 'transaction'
require 'json'

class Till

  def initialize
    @price_list = load_item_prices
    new_transaction
  end

  attr_reader :transaction, :price_list

  def add_item(item, quantity=1)
    validate_item(item)
    quantity.times {current_transaction.add(price_list[item])}
  end

  private
  
  def new_transaction
    @transaction = Transaction.new
  end

  def current_transaction
    transaction
  end

  def load_item_prices
    file = File.read('hipstercoffee.json')
    hash = JSON.parse(file).first
    hash['prices'].first
  end

  def validate_item(item)
    raise 'Only items on the pricelist can be added!' unless price_list.has_key? item 
  end

end
