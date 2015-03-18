require 'receipt'

describe "Receipt" do
  
  let(:muffin){double :product, name: "Blueberry Muffin", price: 4.05}
  let(:cappucino){double :product, name: "Cappucino", price: 3.85}
  let(:order){double :order, contents: [muffin, cappucino, cappucino], items: ["Blueberry Muffin: 1 x 4.05", "Cappucino: 2 x 3.85", "Cappucino: 2 x 3.85"]}
  let(:receipt){Receipt.new(order)}

  it "contains an order" do
    expect(receipt.order).to eq(order)
  end

  it "shows which items have been ordered" do
    expect(receipt.list_items).to include("Blueberry Muffin: 1 x 4.05") 
  end

  it "prints items, numbers, prices, subtotal, tax and total to console" do
    expect(STDOUT).to receive(:puts).with("Blueberry Muffin: 1 x 4.05\nCappucino: 2 x 3.85\nSubtotal: 11.75\nTax: 1.02\nTotal: 12.77")
    receipt.displays_info
  end

end