require_relative "../app/lib/till"
require_relative "../app/lib/order"
require_relative "../app/lib/shop"
require_relative "../app/lib/receipt"

describe "receipt" do
  let(:till) { Till.new }
  let(:shop) { double(:shop) }
  let(:order) { Order.new }
  let(:adjustments) { Adjustments.new }
  let(:receipt) { Receipt.new(order.list, till.tax) }

  it "can print a receipt header with all details" do
    add_muffin
    allow(shop).to receive(:array_of_details).and_return(["The Coffee Connection", "123 Lakeside Way", "16503600708"])
    expect(receipt.print_receipt_head(shop.array_of_details).length).to eq(4)
  end

  it "can print a receipt body with order details" do
    add_muffin
    add_items
    expect(receipt.print_receipt_body.length).to eq 3
  end

  it "can print a receipt footer with payment details" do
    add_muffin
    add_items
    expect(receipt.print_receipt_footer(till.tax_total(order.list, adjustments), till.total_of(order.list, adjustments), adjustments, 50).length).to eq 5
  end
end
