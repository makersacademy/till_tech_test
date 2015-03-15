require 'json'

class Shop

	attr_accessor :menu, :all_shop_information

	def initialize(filename)
		@all_shop_information = open_shop_info(filename)
		@menu = open_menu(all_shop_information)
	end

	def options(chosen_product)
		menu[chosen_product]
	end

	def details(required_info)
		all_shop_information[required_info]
	end

	def available_items
		menu.keys
	end

	def array_of_details
		all_shop_information.values[0..2]
	end

private

	def open_shop_info(filename)
		JSON.parse(File.read(filename)).first
	end

  def open_menu(all_shop_information)
    all_shop_information["prices"].first
  end

end