require 'receipt'

describe "Receipt" do

  let(:order){double :order, items: ["Blueberry Muffin: 1 x 4.05", "Cappucino: 2 x 3.85", "Cappucino: 2 x 3.85"]}
  let(:receipt){Receipt.new(order)}

  it "contains an order" do
    expect(receipt.order).to eq(order)
  end

  it "shows which items have been ordered" do
    expect(receipt.list_items).to include("Blueberry Muffin: 1 x 4.05") 
  end

  it "displays the subtotal of the order" do
    expect(receipt.subtotal).to be(11.75)
  end


end