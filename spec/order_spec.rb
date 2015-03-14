require_relative '../app/lib/order'
require_relative 'spec_helper'

describe 'order' do
	
	let(:shop)  { double("shop")  }
	let(:order) { Order.new("Bob")}

	it 'can have a name to distinguish itself from other orders' do
		expect(order.customer_name).to eq("Bob")
	end

	it 'can provide a list of the item names ordered' do
		add_items
		expect(order.list_of_item_names).to eq(["Cafe Latte", "Cappucino"])
	end

	it 'can provide a list of the quantities ordered' do
		add_items
		expect(order.list_of_item_quantities).to eq([2,1])	
	end

	it 'can provide a list of the prices of items ordered' do
		add_items
		expect(order.list_of_item_prices).to eq([9.50,3.85])
	end

	xit 'can return a total for multiple quantities of any item' do
		allow(shop).to receive(:options).and_return(4.75)
		expect(order.line_total(shop.options("Cafe Latte"), 2)).to eq(9.50)
	end

	it 'if the same item has been previously added, it updates the quantity' do
		add_muffin
		add_muffin
		expect(order.list_of_item_quantities).to eq([2])		
	end

	it 'if the same item has previously been added, it updates the price' do
		add_muffin
		add_muffin
		expect(order.list_of_item_prices).to eq([8.10])	
	end

end