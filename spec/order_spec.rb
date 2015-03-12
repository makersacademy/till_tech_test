require 'order'

describe 'Order' do

  let(:muffin){double :product, name: "Blueberry Muffin", price: 4.05}
  let(:cappucino){double :product, name: "Cappucino", price: 3.85}
  let(:order){Order.new(muffin)}
  let(:big_order){Order.new(muffin, cappucino)}
  
  it "contains at least one product" do
    expect(order.contents).to eq([muffin])
  end

  it "can contain more than one product" do
    expect(big_order.contents).to eq([muffin, cappucino])
  end

end