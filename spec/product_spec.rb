require 'product'

describe Product do
  let (:product) { described_class.new('name', 1) }

  describe 'when created it' do
    it 'has a name' do
      expect(product).to respond_to :name
    end

    it 'has a price' do
      expect(product).to respond_to :price
    end
  end
end
