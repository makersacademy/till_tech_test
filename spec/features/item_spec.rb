require 'item'

describe Item do

  it "an Americano item has a name of 'Americano'" do
    options = { name: 'Americano' }
    tea = Item.new(options)
    expect(tea.name).to eq 'Americano'
  end

  it "an Americano item has a price of 3.75" do
    options = { name: 'Americano', price: 3.75 }
    tea = Item.new(options)
    expect(tea.price).to eq 3.75
  end

end