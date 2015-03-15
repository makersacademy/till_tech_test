require 'receipt'

describe Receipt do
  context 'Calculating line prices' do

    let(:order_dbl){double :order}
    let(:receipt){Receipt.new(order_dbl)}

    it 'Returns a price for each item' do
      expect(receipt.price_for('Cafe Latte')).to eq 4.75
    end

    it 'Returns a line price for an item and quantity' do
      two_choc_mousses = {item: 'Choc Mousse', quantity: 2}

      expect(receipt.line_price_for(two_choc_mousses)).to eq 16.40
    end
  end

  context 'Calculating the total for a whole order' do

    order = [{item: 'Tea', quantity: 1},{item: 'Cappucino', quantity: 3}]
    let(:receipt){Receipt.new(order)}

    it 'Before taxes or discounts' do
      expect(receipt.subtotal).to eq 15.20
    end

  end
end