require_relative '../app/lib/order'

describe Order do

  let(:order){Order.new}

  context 'On initialization' do
    it 'Is empty' do
      expect(order.current).to be_empty
    end
  end

  context 'Adding items to an order' do
    it 'Accepts an item and a quantity' do
      order.add('Cafe Latte', 2)

      expect(order.current.first[:item]).to eq 'Cafe Latte'
      expect(order.current.first[:quantity]).to eq 2
    end

    it 'Defaults to one item if a quantity isn\'t passed' do
      order.add('Cafe Latte')

      expect(order.current.first[:quantity]).to eq 1
    end

  end
end