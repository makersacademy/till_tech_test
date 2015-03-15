require 'till'

describe Till do

  let(:till){Till.new}

  context 'On initialization' do
    it 'Loads the price list' do
      expect(till.price_list.kind_of? Hash).to be true
    end
  end

  context 'Adding items to an order' do
    it 'Has an empty order by default' do
      expect(till.current_order).to be_empty
    end

    it 'Can add one item to an order' do
      till.add_item('Cappucino', 4)

      expect(till.current_order).to eq [{item: 'Cappucino', quantity: 4}]
    end
  end
end