require 'item'

describe Item do

  it "an Americano item has a name of 'Americano'" do
    options = { name: 'Americano' }
    americano = Item.new(options)
    expect(americano.name).to eq 'Americano'
  end

  it "an Americano item has a price of 3.75" do
    options = { name: 'Americano', price: 3.75 }
    americano = Item.new(options)
    expect(americano.price).to eq 3.75
  end

end