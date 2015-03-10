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
		till.add_line_total_to_order_calc("Caffe Latte", 2)
		expect(till.customer_order.length).to eq(1)
	end

	it 'can calculate the subtotal of an order' do
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.add_line_total_to_order_calc(menu.options("Caffe Latte"), 2)
		till.add_line_total_to_order_calc(menu.options("Cappucino"), 1)
		expect(till.subtotal).to eq(13.35)
	end

	it 'can calculate the total of an order inc. tax' do
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.add_line_total_to_order_calc(menu.options("Caffe Latte"), 2)
		till.add_line_total_to_order_calc(menu.options("Cappucino"), 1)
		expect(till.total).to eq(14.50)
	end

	it 'can provide a list of the item names ordered' do
		allow(menu).to receive(:options).and_return(4.75)
		till.add_item_to_print_out("Caffe Latte", 2, till.line_total(menu.options("Caffe Latte"), 2))
		expect(till.list_of_item_names).to eq(["Caffe Latte"])
	end

	it 'can provide a list of the quantities ordered' do
		allow(menu).to receive(:options).and_return(4.75)
		till.add_item_to_print_out("Caffe Latte", 2, till.line_total(menu.options("Caffe Latte"), 2))
		expect(till.list_of_item_quantities).to eq([2])	
	end

	it 'can provide the time and date' do
		expect(till.time_and_date).to eq(Time.now.strftime("%d/%m/%Y %H:%M"))
	end

	xit 'can output the quantity of each item purchased' do
		allow(menu).to receive(:options).and_return(4.75,3.85)
		till.add_line_total_to_order_calc(menu.options("Caffe Latte"), 2)
		till.add_line_total_to_order_calc(menu.options("Cappucino"), 1)
		expect(till.list_quantities).to eq([2,1])
	end

end