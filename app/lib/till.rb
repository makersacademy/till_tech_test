class Till

	attr_reader :discount_threshold, :discount_rate, :tax, :item_discount_rate, :item_on_discount

	def initialize
		@discount_threshold = 50
		@discount_rate = 0.95
		@item_on_discount = "Muffin"
		@item_discount_rate = 0.90 #10% discount
		@tax = 1.0864
	end

	def total_of(order)
		order_after_discount = discount(subtotal_of(order))
		(order_after_discount * tax).round(2)
	end

	def subtotal_of(order)
		order.values.collect(&:last).inject(:+)
	end

	def calculate_change(money_given, order_total)
		money_given - order_total
	end

	def discount(order_subtotal)
		if order_subtotal > discount_threshold
			(order_subtotal * discount_rate).round(2)
		else
			order_subtotal
		end
	end

	def item_discount(order)	
		order.each do |item, array| 
			(order[item] = [ array.first, (array.last*item_discount_rate).round(2) ]) if item.include?(item_on_discount)
		end
	end

end