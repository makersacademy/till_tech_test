require 'json'

module Menu

  attr_reader :price_list

  def load_price_list
    file = File.read('hipstercoffee.json')
    @price_list = JSON.parse(file).first['prices'].first
  end
end