require './lib/menu'

describe Menu do

  let(:menu) { Menu.new(spaghetti: {name: 'Spaghetti', price: 5.0 }) }

  it 'manufactures order information' do
    expect(menu.order(:spaghetti)[:name]).to eq 'Spaghetti'
  end

  it 'raises an error if ordered item is not on the menu' do
    expect{ menu.order(:tiramisu) }.to raise_error("'Tiramisu' is not on the menu")
  end
end
