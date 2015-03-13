require 'menu'

describe 'a menu' do

  let(:dummy_receipt) { Class.new { extend Menu } }

  before(:each) do
    dummy_receipt.menu_read_price_list
  end

  describe 'loading of prices' do

    it 'should have items loaded' do
      expect(dummy_receipt.price_list).not_to be_empty
    end

    it 'should have prices against each item' do
      expect(dummy_receipt.price_list.keys.length).to eq(dummy_receipt.price_list.values.length)
    end

  end

  describe 'loading of items' do

    it 'should be an array' do
      expect(dummy_receipt.menu_read_items.kind_of?(Array)).to be true
    end

    it 'should not be empty' do
      expect(dummy_receipt.menu_read_items).not_to be_empty
    end

  end

end
