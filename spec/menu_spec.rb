require 'menu'

describe "Menu" do

	let(:menu) {Menu.new}

	it 'has a hash for storing products and prices' do
		expect(menu.prices).to be_a Hash
	end

	it 'can return the price when given a key' do
		expect(menu.options("Caffe Latte")).to eq(4.75)
	end

end