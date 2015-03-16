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

  context 'via the calculator module' do

    before do
      allow(order).to receive(:number_of).with(muffin).and_return(1)
      allow(order).to receive(:number_of).with(cappucino).and_return(2)
    end

    it "displays subtotal of the order" do
      expect(receipt.subtotal).to be(11.75)
    end

    it "displays tax for order" do
      expect(receipt.calculate_tax).to be(1.02)
    end

    it "tax is rounded to the nearest 2 decimal float" do
      allow(receipt).to receive(:subtotal).and_return(10.55)
      expect(receipt.calculate_tax).to be(0.91)
    end

  end


end