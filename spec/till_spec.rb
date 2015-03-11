require 'till'

describe Till do

  let(:till){Till.new}

  it "can have the address" do 
    till.address = "123 Lakeside Way"
    expect(till.address).to eq("123 Lakeside Way")
  end

  it "can have a number of tables" do 
    till.tables = 4
    expect(till.tables).to eq(4)
  end

  it "can have a number" do 
    till.phone = "16503600708"
    expect(till.phone).to eq("16503600708")
  end

  it "can have a name of the restaurant" do 
    till.shopName = "The Coffee Connection"
    expect(till.shopName).to eq("The Coffee Connection")
  end

  it "can have a number of waiters taking orders" do 
    till.waiters = 2
    expect(till.waiters).to eq(2)
  end

end