require 'shop'

describe "Shop" do

	let(:shop) {Shop.new('hipstercoffee.json')}

	it 'has a hash for storing products and prices' do
		expect(shop.menu).to be_a Hash
	end

	it 'can return the price when given a key' do
		expect(shop.options("Cafe Latte")).to eq(4.75)
	end

	it 'can return its name' do
		expect(shop.name).to eq("The Coffee Connection")
	end

	it 'can return its address' do
		expect(shop.address).to eq("123 Lakeside Way")
	end

	it 'can return its phone number' do
		expect(shop.phone_number).to eq("16503600708")
	end
	
end	