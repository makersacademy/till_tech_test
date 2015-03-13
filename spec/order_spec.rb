require 'order'

describe Order do 
  let(:item1){Item.new(:name=>"Coffe",
                       :price=>2.45)}
  let(:item2){Item.new(:name=>"Cookie",
                       :price=>0.99)}
  let(:order){Order.new({item1=>1,item2=>2})}

  it 'can count the items' do
    expect(order.count_items).to eq(3)
  end
end 
