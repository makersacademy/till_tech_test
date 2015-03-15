class Adjustments

	attr_reader :discount_threshold, :discount_rate, :item_discount_rate, :item_on_discount

	def initialize
		@discount_threshold = 50
		@discount_rate = 0.95 #5% discount
		@item_on_discount = "Muffin"
		@item_discount_rate = 0.90 #10% discount_threshold
	end

	def discount(order_subtotal)
		order_subtotal > discount_threshold ? 
		(order_subtotal * discount_rate).round(2) : order_subtotal
	end

	def item_discount(order)	
		order.each do |item, array| 
			(order[item] = [ array.first, (array.last*item_discount_rate).round(2) ]) if item.include?(item_on_discount)
		end
	end

	def item_discount_total(order)
		total = []
		order.each do |item, array| 
			total << order[item].last if item.include?(item_on_discount)
		end
		total.inject(:+)
	end

end