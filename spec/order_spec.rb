require 'order'

describe "an order" do

  before(:each) do
    @order = Order.new
  end


  it 'should be empty when created' do
    expect(@order.items).to be_empty
  end

  it 'should be capable of receiving an item and a quantity' do
    @order.add_item("banana", 7)
    expect(@order.items). to eq({"banana" => 7})
  end

end
