class Till

	attr_reader :customer_order, :tax, :complete_order

	def initialize
		@complete_order = {}
		@customer_order = []
		@tax = 1.0864
	end

	def line_total(price, quantity)
		price * quantity
	end

	def add_line_total_to_order_calc(price, quantity)
		customer_order << self.line_total(price, quantity)
	end

	def add_item_to_print_out(name, price, quantity)
		complete_order.store(name, [quantity, price])
	end

	def record_item(name, price, quantity)
		add_item_to_print_out(name, price, quantity)
		add_line_total_to_order_calc(price, quantity)
	end

	def list_of_item_names
		complete_order.keys
	end

	def list_of_item_quantities
		quantities = []
		complete_order.values.collect(&:last)
	end

	def list_of_line_prices
		customer_order
	end

	def subtotal
		customer_order.inject(:+)
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

end