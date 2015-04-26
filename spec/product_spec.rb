require 'product'

describe Product do
  let (:product) { described_class.new('Tea', 1.75) }

  describe 'when created it' do
    it 'responds to name method' do
      expect(product).to respond_to :name
    end
    it 'has a name' do
      expect(product.name).to eq 'Tea'
    end

    it 'responds to price method' do
      expect(product).to respond_to :price
    end
    it 'has a price' do
      expect(product.price).to eq 1.75
    end
  end
end
