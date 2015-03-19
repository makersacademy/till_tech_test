require 'json'

class Shop
  attr_reader :menu, :all_shop_information, :shop_file

  def initialize
    @shop_file = 'hipstercoffee.json'
    @all_shop_information = open_shop_info
    @menu = open_menu
  end

  def available_menu_items
    menu.keys
  end

  def array_of_details
    all_shop_information.values[0..2]
  end

  private

  def open_shop_info
    JSON.parse(File.read(shop_file)).first
  end

  def open_menu
    all_shop_information["prices"].first
  end
end
