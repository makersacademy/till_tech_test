require 'rspec'
require 'menu'

describe 'Menu' do

  let(:menu){ Menu.new }

  it 'should have items inside' do
    expect(menu.list).not_to be_empty
  end

  context 'items' do

    it 'should have prices' do
      expect(menu.price('Cappuccino')).to eq 3.85
    end
  end

end