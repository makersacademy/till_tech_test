require_relative '../app/lib/till'

describe 'a till' do

  let(:till) { Till.new }

  describe 'taking an order' do

    it 'should produce a list of items available on the menu' do
      expect(till.menu_read_items.kind_of?(Array)).to be true
    end


    before(:each) do
      till.new_order
    end

    it 'should be able to create a new order' do
      expect(till.order_list).to be_empty
    end

    it 'should be able to add new items to an order' do
      till.add_item_to_order('Americano', 2)
      expect(till.order_list).to eq([{item: 'Americano', quantity: 2}])
    end

  end

  describe 'printing a receipt' do

    it 'should print a receipt' do
      allow(till).to receive(:order_list).and_return([{item: "Cafe Latte", quantity: 2}, {item: "Blueberry Muffin", quantity: 1}])
      expect(till.print_receipt).to eq(['Cafe Latte 2 x 4.75','Blueberry Muffin 1 x 4.05','Discount 0.41','Tax 1.14','Total 14.28'])
    end

  end

  describe 'taking payment' do

    it 'should take payment' do
      allow(till).to receive(:total_due).and_return(21.67)
      expect(till.payment(25)).to eq('Change - 3.33')
    end

  end

end
