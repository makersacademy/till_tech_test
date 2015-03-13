require 'json'

module Menu

  attr_reader :price_list

  def menu_read_price_list
    file = File.read('./hipstercoffee.json')
    @price_list = JSON.parse(file).first['prices'].first
  end

  def menu_read_items
    menu_read_price_list
    price_list.keys
  end

end
