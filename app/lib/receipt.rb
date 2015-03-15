module Receipt

	def print_receipt_head(shop_details)
		receipt_header = [time_and_date]
		shop_details.each { |detail| receipt_header << detail }
		receipt_header
	end

	def print_receipt_body(order)
		receipt_body = []
		order.each { |item, details| receipt_body << "#{item} #{details[0]} x $#{details[1].round(2)}" }
		receipt_body
	end

	def time_and_date
		Time.now.strftime("%d/%m/%Y %H:%M")
	end

end