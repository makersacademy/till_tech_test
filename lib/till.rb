class Till

	attr_reader :customer_order, :tax

	def initialize
		@customer_order = []
		@tax = 1.0864
	end

	def line_total(product_price, quantity)
		product_price * quantity
	end

	def add_line_total_to_order(product_price, quantity)
		@customer_order << self.line_total(product_price, quantity)
	end

	def subtotal
		@customer_order.inject(:+)
	end

	def total
		(subtotal * self.tax).round(2)
	end

	def time_and_date
		Time.now.strftime("%d/%m/%Y %H:%M")
	end

end