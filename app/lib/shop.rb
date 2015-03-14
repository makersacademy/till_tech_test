require 'json'

class Shop

	attr_accessor :menu, :shop_details

	def initialize(filename)
		@shop_details = open_shop_info(filename)
		@menu = open_menu(shop_details)
	end

	def open_shop_info(filename)
		JSON.parse(File.read(filename)).first
	end

  def open_menu(shop_details)
    shop_details["prices"].first
  end

	def options(chosen_product)
		menu[chosen_product]
	end

	def details(required_info)
		shop_details[required_info]
	end

end