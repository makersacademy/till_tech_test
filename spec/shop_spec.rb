require_relative '../app/lib/shop'

describe "Shop" do

	let(:shop) {Shop.new}

	it 'has a hash for storing products and prices' do
		expect(shop.menu).to be_a Hash
	end
	
	it 'can return its name, address and phone number in an array' do
		expect(shop.array_of_details.length).to eq(3)
	end

	it 'can return a list of items available' do
		expect(shop.available_menu_items.length).to eq(15)
	end

end