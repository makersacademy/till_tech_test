	def add_items
		allow(shop).to receive(:options).and_return(4.75,3.85)
		order.record_item("Cafe Latte", shop.options("Cafe Latte"), 2)
		order.record_item("Cappucino", shop.options("Cappucino"), 1)
	end