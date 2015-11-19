require 'till'

describe Till do

  subject = described_class

  let(:coffee_shop) do
    {
      prices: { "Latte" => 400, "Flat White" => 300,
        "Muffin" => 100, "Steak" => 2000},
      tax_rate: 0.0864,
      discounts: {"Muffin" => 0.1, "Flat White" => 0.5},
      bill_discount:  {threshold: 5000, rate: 0.05}
    }
  end

  let(:customer_order) do
    {
      order: {"Latte" => 1, "Flat White" => 2, "Muffin" => 3, "Steak" => 2},
      payment: 6000
    }
  end

  let(:items) do
    {
      "Latte" => {quantity: 1, price: 400, sum: 400},
      "Flat White" => {quantity: 2, price: 300, sum: 600},
      "Muffin" => {quantity: 3, price: 100, sum: 300},
      "Steak" => {quantity: 2, price: 2000, sum: 4000}
    }
  end

  let(:discounts) do
    {
      "Muffin" => {rate: 0.1, amount: 30},
      "Flat White" => {rate: 0.5, amount: 300},
      :bill => {rate: 0.05, threshold: 5000, amount: 265}
    }
  end

  let(:receipt) do
    {
      items: items,
      items_total: 5300,
      discounts: discounts,
      total_inc_discounts: 4705,
      tax: 407,
      total_inc_tax: 5112,
      payment: 6000,
      change: 888
    }
  end

  before do
    subject.coffee_shop = coffee_shop
    subject.customer_order = customer_order
  end

  it "produces item entries" do
    expect(subject.items).to eq items
  end

  it "sums up the item entries" do
    expect(subject.items_total).to eq 5300
  end

  it "calculates all the discounts" do
    expect(subject.discounts).to eq discounts
  end

  it "works out total including discounts" do
    expect(subject.total_inc_discounts).to eq 4705
  end

  it "calculates tax on the bill" do
    expect(subject.bill_tax).to eq 407
  end

  it "works out final total" do
    expect(subject.total_inc_tax).to eq 5112
  end

  it "calculates the correct change" do
    expect(subject.change).to eq 888
  end

  it "produces a receipt" do
    expect(subject.receipt).to eq receipt
  end

end
