class Till

	attr_reader :customer_order, :tax, :complete_order

	def initialize
		@complete_order = {}
		@tax = 1.0864
	end

	def line_total(price, quantity)
		price * quantity
	end

	def record_item(name, price, quantity)
		add_item_to_print_out(name, price, quantity)
	end

	def list_of_item_names
		complete_order.keys
	end

	def list_of_item_quantities
		complete_order.values.collect(&:first)
	end

	def subtotal
		complete_order.values.collect(&:last).inject(:+)
	end

	def total
		(subtotal * self.tax).round(2)
	end

	def time_and_date
		Time.now.strftime("%d/%m/%Y %H:%M")
	end

	def print_out_order
		puts complete_order
	end

private

	def add_item_to_print_out(name, price, quantity)
		complete_order.store(name, [quantity, price*quantity])
	end

end