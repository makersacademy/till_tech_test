require 'till'

describe Till do

  let(:till){Till.new(:tables=>4,:address=>"123 Lakeside Way",:phone=>"16503600708",
                      :shopName=>"The Coffee Connection",:waiters=>2,:tax=>8.64)}
  let(:item1){Item.new(:name => "Latte",:price => 2.75)}
  let(:item2){Item.new(:name => "Muffin of the day",:price => 4.55)}
  let(:order){Order.new({item1=>2},1)}

  it "can have the address" do 
    expect(till.address).to eq("123 Lakeside Way")
  end

  it "can have a number of tables" do 
    expect(till.tables).to eq(4)
  end

  it "can have a phone number" do 
    expect(till.phone).to eq("16503600708")
  end

  it 'can should have a tax rate' do 
    expect(till.tax).to eq(8.64)
  end

  it "can have a name of the restaurant" do 
    expect(till.shopName).to eq("The Coffee Connection")
  end

  it "can have a number of waiters taking orders" do 
    expect(till.waiters).to eq(2)
  end

  it "can add an item to the menu" do     
    till.add_item_to_menu(item1)
    expect(till.prices.count).to eq(1)
  end 

  it "can take the money and calculate the change" do
    expect(till.change(order,10)).to eq(4.02)
  end

  it "can add discount data" do 
    till.addDiscount({50=>5,item2=>10})
    expect(till.discount).to eq({50=>5,item2=>10})
  end


end