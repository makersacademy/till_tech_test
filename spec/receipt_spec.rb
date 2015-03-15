require 'receipt'

describe Receipt do
  context 'Each item' do

    let(:order_dbl){double :order}
    let(:receipt){Receipt.new(order_dbl)}

    it 'Returns a price for each item' do
      expect(receipt.price_for('Cafe Latte')).to eq 4.75
    end
  end
end