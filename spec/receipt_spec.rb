describe "Receipt" do

  let(:order){double :order}
  let(:receipt){Receipt.new(order)}

  it "can show a breakdown of the order" do
    expect(receipt.show_breakdown).to have_contents(order)
  end

end