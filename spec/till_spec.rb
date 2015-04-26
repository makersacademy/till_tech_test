require 'till'
require 'product'

describe Till do
  latte = Product.new('Caffe Latte', 4.75)
  americano = Product.new('Americano', 3.75)
  tiramasu = Product.new('Tiramasu', 11.40)

  describe 'counts' do
    it 'the number of each item on an order' do
      subject.order(americano)
      subject.order(tiramasu)
      subject.order(americano)
      subject.order(tiramasu)
      2.times { subject.order(americano) }
      expect(subject.count('Americano')).to eq 4
      expect(subject.count('Tiramasu')).to eq 2
    end
  end

  describe 'shows' do
    it 'the correct line item for 2 caffe lattes' do
      2.times { subject.order(latte) }
      expect(subject.line_items).to include 'Caffe Latte 2 x £4.75'
    end

    it 'the correct line item for 4 Americanos and 2 Tiramasus' do
      4.times { subject.order(americano) }
      2.times { subject.order(tiramasu) }
      expect(subject.line_items).to include 'Americano 4 x £3.75'
      expect(subject.line_items).to include 'Tiramasu 2 x £11.40'
    end
  end

  describe 'calculates' do
    it 'the correct total for 2 Cafe Lattes' do
      2.times { subject.order(latte) }
      expect(subject.checkout).to eq '£9.50'
    end

    it 'the correct total for 4 Americanos' do
      4.times { subject.order(americano) }
      expect(subject.checkout).to eq '£15.00'
    end

    it 'the correct total for 4 Americanos and 2 Tiramasus' do
      4.times { subject.order(americano) }
      2.times { subject.order(tiramasu) }
      expect(subject.checkout).to eq '£37.80'
    end
  end

end
