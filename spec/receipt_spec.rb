require 'receipt'

describe 'a receipt' do

  describe 'initializing a receipt' do

    it 'should know what level of tax to apply' do
      receipt = Receipt.new(8)
      expect(receipt.tax).to eq(8)
    end

    it 'should default to 0 tax if tax not provided' do
      receipt = Receipt.new
      expect(receipt.tax).to eq(0)
    end

  end

  describe 'pricing a line item' do

    let(:receipt) {Receipt.new}

    it 'should know the price of each item' do
      expect(receipt.price_of('Cafe Latte')).to eq(4.75)
    end

    it 'should know the cost of a line item (item price * quantity)' do
      expect(receipt.line_price({item: 'Cafe Latte', quantity: 2})).to eq(9.5)
    end

  end

  describe 'calculating the order total before discounts and tax' do

    let(:receipt) {Receipt.new}

    it 'should calculate the total for for the complete order' do
      order = [{item: 'Americano', quantity: 2},{item: 'Tea', quantity: 3}]
      expect(receipt.net_total(order)).to eq(18.45)
    end


  end

end
