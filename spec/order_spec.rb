require_relative '../app/lib/order'
require_relative 'spec_helper'

describe 'order' do
	
	let(:shop)  { double("shop")  }
	let(:order) { Order.new}

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

	it 'should be able to be cleared down' do
		add_muffin
		order.clear_order
		expect(order.list).to eq({})
	end

	it 'can be confirmed/finalized' do
		add_muffin
		order.confirm_order?
		expect(order.confirmed).to eq(true)
	end

end