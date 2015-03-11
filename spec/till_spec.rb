require 'till'

describe Till do

  let(:till) {Till.new}

  context 'Opening and closing a transaction' do
    it 'Can open a new transaction' do
      expect(till.transaction).not_to be nil
    end
  end

  context 'Adding items' do
    it 'Can add a single item to a transaction' do
      till.add_item('Cappucino')
      expect(till.transaction.subtotal).to eq 3.85
    end

    it 'Can add multiples of an item to a transaction' do
      till.add_item('Cappucino', 2)
      expect(till.transaction.subtotal).to eq 7.70
    end

  end
end
