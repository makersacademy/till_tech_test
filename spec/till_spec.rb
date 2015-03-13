require 'till'

describe Till do

  let(:till){Till.new(4,"123 Lakeside Way","16503600708",
                      "The Coffee Connection",2)}

  it "can have the address" do 
    expect(till.address).to eq("123 Lakeside Way")
  end

  it "can have a number of tables" do 
    expect(till.tables).to eq(4)
  end

  it "can have a phone number" do 
    expect(till.phone).to eq("16503600708")
  end

  it "can have a name of the restaurant" do 
    expect(till.shopName).to eq("The Coffee Connection")
  end

  it "can have a number of waiters taking orders" do 
    expect(till.waiters).to eq(2)
  end

  it "can add an item to the menu" do 
    item1 = Item.new(:name => "Latte",:price => 2.75)
    till.add_item_to_menu(item1)
    expect(till.menu.count).to eq(1)
  end 


end