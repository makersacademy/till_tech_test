require_relative '../app/lib/menu'

class MenuWrapper
  include Menu
end

describe 'Menu' do

  let(:menu){MenuWrapper.new}

  before {menu.load_price_list}

  context 'Loading items' do
    it 'Loads the price list file' do
      expect(menu.price_list).not_to be_empty
    end

    it 'Has a price for an item' do
      expect(menu.price_list['Cappucino']).to eq 3.85
    end

    it 'Has a price for all the items' do
      expect(menu.price_list.keys.length).to eq menu.price_list.values.length
    end
  end

end