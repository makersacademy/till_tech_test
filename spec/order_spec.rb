require './lib/order'

describe Order do

  it 'can be assigned a price' do
    order       = Order.new('spaghetti')
    order.price = 3 
    
    expect(order.price).to eq 3
  end
end
