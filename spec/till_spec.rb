require 'till'
require 'product'

describe Till do
  before(:each) do
    subject.read_product_list('hipstercoffee.json')
  end

  it 'can read the business details from a JSON file' do
    till = described_class.new
    till.read_header('hipstercoffee.json')
    expect(till.business).to eq 'The Coffee Connection'
    expect(till.address).to eq '123 Lakeside Way'
    expect(till.phone).to eq '16503600708'
  end

  it 'can read a product list from a JSON file' do
    till = described_class.new
    till.read_product_list('hipstercoffee.json')
    expect(till.product_list.length).to eq 15
  end

  it 'can find the cost of a named product' do
    expect(subject.cost('Affogato')).to eq 14.80
    expect(subject.cost('Cortado')).to eq 4.55
    expect(subject.cost('Choc Mousse')).to eq 8.20
  end

  it 'can acept an order for a single item' do
    subject.order('Cafe Latte')
    expect(subject.order_items).to include 'Cafe Latte'
  end

  it 'can show the quantity of an item ordered' do
    3.times { subject.order('Cafe Latte') }
    4.times { subject.order('Cortado') }
    expect(subject.count('Cafe Latte')).to eq 3
    expect(subject.count('Cortado')).to eq 4
  end

  describe 'can calculate' do
    it 'the correct subtotal for an order' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.subtotal.round(2)).to eq 9.50
    end

    it 'the correct tax for an order' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.tax.round(2)).to eq 0.82
    end

    it 'the correct total (incl tax) for an order' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.total.round(2)).to eq 10.32
    end

    it 'the correct sub total for for an order of several products' do
      4.times { subject.order('Americano') }
      2.times { subject.order('Tiramisu') }
      5.times { subject.order('Blueberry Muffin') }
      expect(subject.subtotal.round(2)).to eq 58.05
    end

  end
end
