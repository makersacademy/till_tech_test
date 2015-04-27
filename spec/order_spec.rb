require 'order'
require 'product'

describe Order do

  it 'is empty when created' do
    order = described_class.new
    expect(order.products.length).to eq 0
  end

  it 'can have a product added' do
    subject.add(:latte)
    expect(subject.products.length).to eq 1
  end

  it 'can have multiple products' do
    tea = Product.new('Tea', 1.75)
    latte = Product.new('Caffe Latte', 4.75)
    subject.add(tea)
    subject.add(latte, 6)
    # subject.products.each { |product| print product.name, "\t", product.price, "\n" }
    expect(subject.products.length).to eq 7
  end
end
