require 'till'

describe Till do

  subject = described_class

  let(:coffee_shop) { {
    shopName: "Happy Coffee Shop",
    prices: { "Latte": 4, "Flat White": 3 },
    taxRate: 0.0864 } }

  let(:customer_order) { {
    customerName: "Jane",
    order: { "Latte": 1, "Flat White": 2 } } }

  let(:line_entries) { {
    "Latte": { quantity: 1, item_price: 4, line_total: 4 },
    "Flat White": { quantity: 2, item_price: 3, line_total: 6 } } }

  let(:receipt) { {
    items: line_entries,
    total_before_tax: 10,
    tax: 0.86,
    total_inc_tax: 10.86 } }

  before do
    subject.coffee_shop = coffee_shop
    subject.customer_order = customer_order
  end

  it "produces line totals" do
    expect(subject.line_entries).to eq line_entries
  end

  it "calculates the total price of the order" do
    expect(subject.total_before_tax).to eq 10
  end

  it "calculates the tax of an order" do
    expect(subject.bill_tax).to eq 0.86
  end

  it "produces a receipt" do
    expect(subject.receipt).to eq receipt
  end

end
