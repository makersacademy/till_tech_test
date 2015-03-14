require_relative '../app/lib/till'
require_relative '../app/lib/order'

describe 'till' do

	let(:till)  {Till.new        }
	let(:shop)  {double(:shop)   }
	let(:order) {Order.new("Bob")}

	it 'can calculate the subtotal of an order' do
		add_items
		expect(till.subtotal_of(order.complete_list)).to eq(13.35)
	end

	it 'can calculate the total of an order inc. tax' do
		add_items
		expect(till.total_of(order.complete_list)).to eq(14.50)
	end

	it 'can work out how much change is owed to customer' do
		add_items
		expect(till.calculate_change(20.00, till.total_of(order.complete_list))).to eq(5.50)
	end

	it 'can calculate a 5% discount for orders over $50' do
		add_many_items
		expect(till.discount(till.subtotal_of(order.complete_list))).to eq(63.41)
	end

	it 'doesnt do a discount for orders under $50' do
		add_items
		expect(till.discount(till.subtotal_of(order.complete_list))).to eq(13.35)
	end

	it 'can calculate a 10% discount on muffins' do
		add_muffin
		expect(till.subtotal_of(till.item_discount(order.complete_list))).to eq(3.65)
	end

	it 'doesnt calculate a 10% discount for non-muffins' do
		add_items
		expect(till.subtotal_of(till.item_discount(order.complete_list))).to eq(13.35)
	end

end