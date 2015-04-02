require_relative "../app/lib/till"
require_relative "../app/lib/order"
require_relative "../app/lib/shop"

describe "till" do
  let(:till) { Till.new }
  let(:shop) { double(:shop) }
  let(:order) { Order.new }
  let(:adjustments) { Adjustments.new }

  it "can calculate the subtotal of an order" do
    add_items
    expect(till.subtotal_of(order.list)).to eq(13.35)
  end

  it "can calculate the total of an order inc. tax" do
    add_items
    expect(till.total_of(order.list, adjustments)).to eq(14.50)
  end

  it "can work out how much change is owed to customer" do
    add_items
    expect(till.calculate_change(20.00, till.total_of(order.list, adjustments))).to eq(5.50)
  end

  it "can show how much tax is on the order" do
    add_muffin
    expect(till.tax_total(order.list, adjustments)).to eq(0.35)
  end
end
