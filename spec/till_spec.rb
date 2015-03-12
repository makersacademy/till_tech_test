require 'till'
require 'json'

describe 'a till' do

  before(:each) do
    @till = Till.new
  end

  describe 'creating a receipt' do

    xit 'should output each line item total, tax and total' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.generate_receipt).to eq('Cafe Latte 2 x 4.75,Choc Mudcake 1 x 6.40,Tax 1.37,Total 17.27')
    end

    xit 'should display applicable discount amount on the receipt' do
      @till.add_order_item(item: "Blueberry Muffin", quantity: 13)
      expect(@till.generate_receipt).to eq('Blueberry Muffin 13 x 4.05,Discount 7.90,Tax 3.87,Total 48.62')
    end

  end

  describe 'taking payment' do

    xit 'should provide the amount of change from cash offered' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.take_payment(25)).to eq('The change is 3.77')
    end

    xit 'should return a message if amount tendered is less than total' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.take_payment(20)).to eq('The amount tendered is 1.23 less than the total')
    end

  end

end
