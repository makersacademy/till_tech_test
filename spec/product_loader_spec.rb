require'product_list'

describe 'ProductList' do
  class Dummy_class
    include ProductList
  end

  let(:product_class) { Dummy_class.new { include ProductList } }

  context 'json file loads' do
    it 'returns The Coffee Connection for the shop name.' do
      expect(product_class.data_hash[0]['shopName']).to eq 'The Coffee Connection'
    end

    it 'returns the price for tea of 3.65.' do
      expect(product_class.data_hash[0]['prices'][0]['Tea']).to eq 3.65
    end
  end
end