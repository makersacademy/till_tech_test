class Order

	attr_reader :customer_name, :complete_list, :confirmed

	def initialize(customer_name)
		@complete_list = {}
		@customer_name = customer_name
		@confirmed = false
	end

	def record_item(name, price, quantity)
		if complete_list.has_key?(name)
			update_item(name, price, quantity)
		else
			complete_list.store(name, [quantity, price*quantity])
		end
	end

	def list_of_item_names
		complete_list.keys
	end

	def list_of_item_quantities
		complete_list.values.collect(&:first)
	end

	def list_of_item_prices
		complete_list.values.collect(&:last)
	end

	def clear_order
		complete_list.clear
	end

	def confirm_order?
		@confirmed = true
	end

private

	def update_item(name, price, quantity)
		old_quantity = complete_list[name].first; old_price = complete_list[name].last
		complete_list[name] = [(old_quantity + quantity), (old_price + (price*quantity))]
	end

end