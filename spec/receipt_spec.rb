require 'receipt'

describe "Receipt" do

  let(:muffin){double :product, name: "Blueberry Muffin", price: 4.05}
  let(:cappucino){double :product, name: "Cappucino", price: 3.85}
  let(:order){double :order}
  let(:receipt){Receipt.new(order)}

  it "contains an order" do
    expect(receipt.order).to eq(order)
  end

  xit "shows which items have been ordered" do
    expect(receipt.items).to include("muffin") 
  end

  xit "shows how many of each item have been ordered" do
  end


end