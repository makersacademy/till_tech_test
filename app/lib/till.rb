require_relative "receipt"

class Till
	include Receipt

	attr_reader :tax

	def initialize
		@tax = 1.0864
	end

	def total_of(order, adjustments)
	  order_after_discount = adjustments.discount(subtotal_of(order))
	  (order_after_discount * tax).round(2)
	end

	def subtotal_of(order)
		order.values.collect(&:last).inject(:+)
	end

	def calculate_change(money_given, order_total)
		money_given - order_total
	end

	def tax_total(order, adjustments)
		(total_of(order, adjustments) - adjustments.discount(subtotal_of(order))).round(2)
	end
end
