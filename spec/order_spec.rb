require 'order'

describe 'Order' do

  let(:muffin){double :product, name: "Blueberry Muffin", price: 4.05}
  let(:cappucino){double :product, name: "Cappucino", price: 3.85}
  let(:order){Order.new(muffin)}
  let(:medium_order){Order.new(muffin, cappucino)}
  let(:big_order){Order.new(muffin, cappucino, cappucino)}
  
  it "contains at least one product" do
    expect(order.contents).to eq([muffin])
  end

  it "can contain more than one product" do
    expect(medium_order.contents).to eq([muffin, cappucino])
  end

  it "counts the frequency of products contained" do
    expect(big_order.number_of(cappucino)).to eq(2)
  end

  it "shows the items and their prices" do
    expect(big_order.items).to eq(["Blueberry Muffin: 1 x 4.05", "Cappucino: 2 x 3.85", "Cappucino: 2 x 3.85"])
  end

end