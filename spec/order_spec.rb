require 'order'

describe Order do

  let(:order) { described_class.new( { table: 1 } ) }

  it 'has table number' do
    expect(order.table).to eq(1)
  end

  describe '#add_item' do

    it 'adds items to the order' do
      order.add_item("Cafe Latte")
      order.add_item("Latte")
      expect(order.items).to eq(["Cafe Latte", "Latte"])
    end

  end

  describe '#add_customer' do

    it 'adds a customer'  do
      order.add_customer("Jane")
      expect(order.customers).to eq(["Jane"])
    end

  end

end
