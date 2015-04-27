require 'product'

describe Product do
  let (:product) { described_class.new('Tea', 1.75) }

  it 'has a name' do
    expect(product.name).to eq 'Tea'
  end

  it 'has a price' do
    expect(product.price).to eq 1.75
  end
end
