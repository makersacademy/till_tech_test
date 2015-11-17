require 'till'

describe Till do

  subject = described_class

  let(:coffee_shop) do
    { shopName: "Happy Coffee Shop",
      prices: { "Cafe Latte": 4, "Flat White": 3, "Muffin": 1, "Steak": 20 },
      taxRate: 0.0864,
      itemDiscounts: { "Muffin": 0.1, "Flapjack": 0.2 },
      billDiscount: { threshold: 50, rate: 0.05 }
    }
  end

  let(:customer_order) do
    { customerName: "Jane",
      order: { "Cafe Latte": 1, "Flat White": 2, "Muffin": 3, "Steak": 2 },
      payment: 60
    }
  end

  let(:line_entries) do
    { "Cafe Latte": { quantity: 1, item_price: 4, line_total: 4 },
      "Flat White": { quantity: 2, item_price: 3, line_total: 6 },
      "Muffin": { quantity: 3, item_price: 1, line_total: 3 },
      "Steak": { quantity: 2, item_price: 20, line_total: 40 },
    }
  end

  let(:discounts) do
    { "10% Muffin discount": 0.3,
      "5% off bill over $50": 2.65
    }
  end

  let(:receipt) do
    { items: line_entries,
      total_before_discounts: 53,
      discounts: discounts,
      total_before_tax: 50.05,
      tax: 4.32,
      total_inc_tax: 54.37,
      payment: 60,
      change: 5.63
    }
  end

  before do
    subject.coffee_shop = coffee_shop
    subject.customer_order = customer_order
  end

  it "produces line totals" do
    expect(subject.line_entries).to eq line_entries
  end

  it "calculates the total before discounts" do
    expect(subject.total_before_discounts).to eq 53
  end

  it "calculates the discounts" do
    expect(subject.discounts).to eq discounts
  end

  it "calculates the total before tax" do
    expect(subject.total_before_tax).to eq 50.05
  end

  it "calculates the tax on the bill" do
    expect(subject.bill_tax).to eq 4.32
  end

  it "calculates the total including tax" do
    expect(subject.total_inc_tax).to eq 54.37
  end

  it "calculates the correct change" do
    expect(subject.change).to eq 5.63
  end

  it "produces a receipt" do
    expect(subject.receipt).to eq receipt
  end

end
