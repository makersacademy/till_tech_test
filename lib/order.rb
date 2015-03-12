class Order

	attr_reader :customer_name, :complete_list

	def initialize(customer_name)
		@complete_list = {}
		@customer_name = customer_name
	end

	# def line_total(price, quantity)
	# 	price * quantity
	# end

	def record_item(name, price, quantity)
		add_item_to_print_out(name, price, quantity)
	end

	def list_of_item_names
		complete_list.keys
	end

	def list_of_item_quantities
		complete_list.values.collect(&:first)
	end

private

	def add_item_to_print_out(name, price, quantity)
		complete_list.store(name, [quantity, price*quantity])
	end

end