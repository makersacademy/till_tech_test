require_relative "../app/lib/till"
require_relative "../app/lib/order"
require_relative "../app/lib/shop"

describe "till" do
  let(:till)        {Till.new       }
  let(:shop)        {double(:shop)  }
  let(:order)       {Order.new      }
  let(:adjustments) {Adjustments.new}

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

  it "can print a receipt header with all details" do
    add_muffin
    allow(shop).to receive(:array_of_details).and_return(["The Coffee Connection", "123 Lakeside Way", "16503600708"])
    expect(till.print_receipt_head(shop.array_of_details).length).to eq(4)
  end

  it "can print a receipt body with order details" do
    add_muffin
    add_items
    expect(till.print_receipt_body(order.list).length).to eq 3
  end

  it "can print a receipt footer with payment details" do
    add_muffin
    add_items
    expect(till.print_receipt_footer(order.list, adjustments, 50).length).to eq 5
  end
end
