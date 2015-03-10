require 'till'
require 'menu'

describe 'till' do
	
	let(:menu) { double("menu")}
	let(:till) { Till.new      }

	it 'can return a total for multiple quantities of any item' do
		allow(menu).to receive(:options).and_return(4.75)
		expect(till.line_total(menu.options("Caffe Latte"), 2)).to eq(9.50)
	end

	it 'can add a line total to a customers order' do
		till.add_line_total_to_order("Caffe Latte", 2)
		expect(till.customer_order.length).to eq(1)
	end

	it 'can calculate the subtotal of an order' do
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.add_line_total_to_order(menu.options("Caffe Latte"), 2)
		till.add_line_total_to_order(menu.options("Cappucino"), 1)
		expect(till.subtotal).to eq(13.35)
	end

	it 'can calculate the total of an order inc. tax' do
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.add_line_total_to_order(menu.options("Caffe Latte"), 2)
		till.add_line_total_to_order(menu.options("Cappucino"), 1)
		expect(till.total).to eq(14.50)
	end

	it 'can provide the time and date' do
		expect(till.time_and_date).to eq(Time.now.strftime("%d/%m/%Y %H:%M"))
	end

end