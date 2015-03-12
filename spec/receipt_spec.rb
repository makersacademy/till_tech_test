require 'receipt'

describe "Receipt" do

  let(:order){double :order, items: [{name: "Blueberry Muffin", price: 4.05},{name: "Cappucino", price: 3.85}, {name: "Cappucino", price: 3.85}] }
  let(:receipt){Receipt.new(order)}

  it "contains an order" do
    expect(receipt.order).to eq(order)
  end

  xit "shows which items have been ordered" do 
  end

  xit "shows how many of each item have been ordered" do
  end


end