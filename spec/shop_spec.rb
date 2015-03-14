require_relative '../app/lib/shop'

describe "Shop" do

	let(:shop) {Shop.new('hipstercoffee.json')}

	it 'has a hash for storing products and prices' do
		expect(shop.menu).to be_a Hash
	end

	it 'can return the price when given a key' do
		expect(shop.options("Cafe Latte")).to eq(4.75)
	end

	it 'can return its name' do
		expect(shop.details("shopName")).to eq("The Coffee Connection")
	end

	it 'can return its address' do
		expect(shop.details("address")).to eq("123 Lakeside Way")
	end

	it 'can return its phone number' do
		expect(shop.details("phone")).to eq("16503600708")
	end

	it 'can return a list of items available' do
		expect(shop.available_items.length).to eq(15)
	end
	
end