require 'order'

describe Order do
  subject(:order) {described_class.new}

  context "when placing an order" do
    before do
      order.add(:blueberry_muffin)
    end
    it "the order updates to reflect a new addition" do
      order.add(:cafe_latte)
      expect(order.check_order).to eq({blueberry_muffin: 1, cafe_latte: 1})
    end
    it "can optionally specify a quantity greater than one" do
      order.add(:cafe_latte, 3)
      expect(order.check_order).to eq({blueberry_muffin: 1, cafe_latte: 3})
    end
    it "adds to a running total of the orders" do
      order.add(:blueberry_muffin, 4)
      expect(order.check_order).to eq({blueberry_muffin: 5})
    end
  end
end
