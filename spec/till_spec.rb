require 'till'
require 'product'
# require 'receipt'

describe Till do
  before(:each) do
    subject.read_file('hipstercoffee.json')
  end

  it 'can read the product list from a JSON file' do
    expect(subject.price_list.length).to eq 15
  end

  it 'can find the cost of a named product' do
    expect(subject.cost('Affogato')).to eq 14.80
    expect(subject.cost('Cortado')).to eq 4.55
    expect(subject.cost('Choc Mousse')).to eq 8.20
  end

  describe 'can show' do
    it 'the correct line item for a product' do
      subject.order('Cafe Latte')
      expect(subject.line_items).to include 'Cafe Latte 1 x £4.75'
    end

    it 'the correct line items for an order of several products' do
      2.times { subject.order('Tiramisu') }
      4.times { subject.order('Americano') }
      5.times { subject.order('Blueberry Muffin') }
      expect(subject.line_items).to include 'Tiramisu 2 x £11.40'
      expect(subject.line_items).to include 'Americano 4 x £3.75'
      expect(subject.line_items).to include 'Blueberry Muffin 5 x £4.05'
    end
  end

  describe 'can calculate' do
    it 'the correct total for 2 Cafe Lattes' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.subtotal).to eq '£9.50'
    end

    it 'the correct total for for an order of several products' do
      4.times { subject.order('Americano') }
      2.times { subject.order('Tiramisu') }
      5.times { subject.order('Blueberry Muffin') }
      expect(subject.subtotal).to eq '£58.05'
    end

    it 'the correct tax for an order' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.tax.round(2)).to eq 0.82
    end
  end
end
