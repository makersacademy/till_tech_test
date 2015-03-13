require 'item'

describe Item do

  let(:item){Item.new(:name => "Cafe Latte",
                      :price => 4.75)}

  it 'can have a name' do 
    expect(item.name).to eq("Cafe Latte")
  end

  it 'can have a price' do 
    expect(item.price).to eq(4.75)
  end 


end