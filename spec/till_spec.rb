require 'till'
require 'menu'

describe 'till' do
	
	let(:menu) { double("menu")}
	let(:till) { Till.new      }

	it 'can return a total for multiple quantities of any item' do
		allow(menu).to receive(:options).and_return(4.75)
		expect(till.line_total(menu.options("Caffe Latte"), 2)).to eq(9.50)
	end

	it 'can calculate the subtotal of an order' do
		add_items
		expect(till.subtotal).to eq(13.35)
	end

	it 'can calculate the total of an order inc. tax' do
		add_items
		expect(till.total).to eq(14.50)
	end

	it 'can provide a list of the item names ordered' do
		add_items
		expect(till.list_of_item_names).to eq(["Caffe Latte", "Cappucino"])
	end

	it 'can provide a list of the quantities ordered' do
		add_items
		expect(till.list_of_item_quantities).to eq([2,1])	
	end

	it 'can provide the time and date' do
		expect(till.time_and_date).to eq(Time.now.strftime("%d/%m/%Y %H:%M"))
	end

	def add_items
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.record_item("Caffe Latte", menu.options("Caffe Latte"), 2)
		till.record_item("Cappucino", menu.options("Cappucino"), 1)
	end

end