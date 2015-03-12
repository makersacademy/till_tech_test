require 'receipt'

describe 'a receipt' do

  describe 'initializing a receipt' do

    let(:double_order) {double('order')}

    it 'should know what level of tax to apply' do
      receipt = Receipt.new(double_order, 8)
      expect(receipt.tax).to eq(8)
    end

    it 'should default to 0 tax if tax not provided' do
      receipt = Receipt.new(double_order)
      expect(receipt.tax).to eq(0)
    end

  end

  describe 'pricing a line item' do

    let(:double_order) {double('order')}
    let(:receipt) {Receipt.new(double_order)}

    it 'should know the price of each item' do
      expect(receipt.price_of('Cafe Latte')).to eq(4.75)
    end

    it 'should know the cost of a line item (item price * quantity)' do
      expect(receipt.line_price({item: 'Cafe Latte', quantity: 2})).to eq(9.5)
    end

  end

  describe 'calculating the order total before discounts and tax' do

    it 'should calculate the total for for the complete order' do
      order = [{item: 'Americano', quantity: 2},{item: 'Tea', quantity: 3}]
      receipt = Receipt.new(order)
      expect(receipt.net_total).to eq(18.45)
    end

  end

  describe 'calculating the tax on an order' do

    let(:double_order) {double('order')}
    let(:receipt) {Receipt.new(double_order, 8.64)}

    it 'should calculate the tax on a net total minus discount' do
      allow(receipt).to receive(:net_total).and_return(55)
      allow(receipt).to receive(:discount_total).and_return(2.75)
      expect(receipt.tax_total).to eq(4.51)
    end

  end

  describe 'calculating the total to be charged for the order' do

    let(:double_order) {double('order')}
    let(:receipt) {Receipt.new(double_order, 8.64)}

    it 'should calculate the total due taking into account discounts & tax' do
      allow(receipt).to receive(:net_total).and_return(55)
      allow(receipt).to receive(:discount_total).and_return(2.75)
      allow(receipt).to receive(:tax_total).and_return(4.51)
      expect(receipt.total_due).to eq(56.76)
    end

  end

  describe 'generating the receipt' do

    it 'should generate a fully itemised receipt' do
      order = [{item: "Cafe Latte", quantity: 2}, {item: "Blueberry Muffin", quantity: 1}]
      receipt = Receipt.new(order, 8.64)
      expect(receipt.print_receipt).to eq('Cafe Latte 2 x 4.75,Blueberry Muffin 1 x 4.05,Discount 0.41,Tax 1.14,Total 14.28')
    end

  end

end
