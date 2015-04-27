require 'till'
require 'product'
# require 'price_list'

describe Till do
  before(:each) do
    subject.read_file('hipstercoffee.json')
    # subject.price_list.each { |product| print product.name, "\t", product.price, "\n" }
  end

  it 'can read the product list from a JSON file' do
    expect(subject.price_list.length).to eq 15
  end

  it 'can find the cost of a named product' do
    subject.read_file('hipstercoffee.json')
    expect(subject.cost('Affogato')).to eq 14.80
    expect(subject.cost('Cortado')).to eq 4.55
    expect(subject.cost('Choc Mousse')).to eq 8.20
  end

  describe 'shows' do
    it 'the correct line item for 2 caffe lattes' do
      subject.read_file('hipstercoffee.json')
      2.times { subject.order('Cafe Latte') }
      expect(subject.line_items).to include 'Cafe Latte 2 x £4.75'
    end

    it 'the correct line items for 4 Americanos and 2 Tiramasus' do
      subject.read_file('hipstercoffee.json')
      2.times { subject.order("Tiramisu") }
      4.times { subject.order("Americano") }
      expect(subject.line_items).to include 'Americano 4 x £3.75'
      expect(subject.line_items).to include 'Tiramisu 2 x £11.40'
    end
  end

  describe 'calculates' do
    it 'the correct total for 2 Cafe Lattes' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.checkout).to eq '£9.50'
    end

    it 'the correct total for 4 Americanos' do
      4.times { subject.order('Americano') }
      expect(subject.checkout).to eq '£15.00'
    end

    it 'the correct total for 4 Americanos and 2 Tiramisus' do
      4.times { subject.order('Americano') }
      2.times { subject.order('Tiramisu') }
      expect(subject.checkout).to eq '£37.80'
    end
  end
end
