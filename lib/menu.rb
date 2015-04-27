class Menu

require 'rubygems'
require 'json'

def initialize
  json = File.read('hipstercoffee.json')
  @data = JSON.parse(json)
end

def all_items_with_prices
  @data[0]["prices"][0]
end

def all_item_names
  @data[0]["prices"][0].keys
end

def all_item_values
  @data[0]["prices"][0].values
end

def item_price(item)
  @data[0]["prices"][0][item]
end

end