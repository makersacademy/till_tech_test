require 'order'

describe Order do 
  let(:item1){Item.new(:name=>"Coffe",
                       :price=>2.99)}
  let(:item2){Item.new(:name=>"Cookie",
                       :price=>0.99)}
  let(:order){Order.new({item1=>1,item2=>2},1)}

  it 'can count the items' do
    expect(order.count_items).to eq(3)
  end

  it 'can calculate the overall sum' do 
    expect(order.total_sum).to eq(4.97)
  end

  it 'can calculate the sum per item' do
    expect(order.items_sum).to eq({item1=>2.99,item2=>1.98})
  end  
end 
