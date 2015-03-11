require 'json'

class Shop

	attr_accessor :menu, :shop_details

	def initialize(filename)
		@shop_details = open_shop_info(filename)
		@menu = open_menu(shop_details)
	end

	def open_shop_info(filename)
		file = File.read(filename)
		JSON.parse(file).first
	end

  def open_menu(shop_details)
     self.shop_details["prices"].first
  end

	def options(chosen_product)
		@menu[chosen_product]
	end
		
	def name
		self.shop_details["shopName"]
	end

	def address
		self.shop_details["address"]
	end

	def phone_number
		self.shop_details["phone"]
	end

end