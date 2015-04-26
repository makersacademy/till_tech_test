require 'price_list'
require 'product'

describe PriceList do
  tea = Product.new('Tea', 1.75)
  latte = Product.new('Caffe Latte', 4.75)

  it 'has no products when created' do
    pricelist = described_class.new
    expect(pricelist.products.length).to eq 0
  end

  it 'can have a product added' do
    subject.add(tea)
    expect(subject.products).to include tea
    expect(subject.products.length).to eq 1
  end

  it 'can have a product removed' do
    subject.add(tea)
    expect(subject.products.length).to eq 1
    subject.remove(tea)
    expect(subject.products.length).to eq 0
  end

  it 'knows the name of a product' do
    subject.add(tea)
    expect(subject.products[0].name).to eq 'Tea'
  end

  it 'knows the price of a product' do
    subject.add(tea)
    expect(subject.products[0].price).to eq 1.75
  end

  it 'can find the cost of a named product' do
    subject.add(tea)
    subject.add(latte)
    expect(subject.cost('Tea')).to eq 1.75
    expect(subject.cost('Caffe Latte')).to eq 4.75
  end

  describe 'can read' do
    it 'the product details from a JSON file' do
      subject.read_file('hipstercoffee.json')
      expect(subject.cost('Affogato')).to eq 14.80
      expect(subject.cost('Cortado')).to eq 4.55
      expect(subject.cost('Choc Mousse')).to eq 8.20
      expect(subject.products.length).to eq 15
    end
  end
end
