require 'order'

describe Order do 
  let(:item1){Item.new(:name=>"Coffe",
                       :price=>2.99)}
  let(:item2){Item.new(:name=>"Cookie",
                       :price=>0.99)}
  let(:order){Order.new({item1=>1,item2=>2})}

  it 'can count the items' do
    expect(order.count_items).to eq(3)
  end

  it 'can calculate the overall sum' do 
    expect(order.sum_order).to eq(4.97)
  end
end 
