require 'order'
require 'menu'

describe 'Order' do

  let(:order){ Order.new({menu: Menu.new, customer: 'Matteo'}) }

  context 'by default' do
    it 'should have an empty total' do
      expect(order.bill).to be_empty
    end

    it 'could have a name' do
      expect(order.customer).to eq 'Matteo'
    end
  end

  context 'adding items to the bill' do

    it 'should allow the hipster to click on an item button and add its price' do
      order.add('Cappuccino')
      expect(order.bill).to eq [3.85]
    end

    it 'should allow the hipster to select the quantity first, and then the item' do
      order.add(2, 'Cappuccino')
      expect(order.bill).to eq [7.7]
    end
  end

end