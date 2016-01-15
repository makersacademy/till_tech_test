require 'calculate_total'

describe CalculateTotal do
  subject(:calculate_total) {described_class.new(prices, order)}
  let(:order) {double(:order)}
  let(:prices) {{cafe_latte: 4.75, blueberry_muffin: 4.05}}
  before do
    allow(order).to receive(:check_order).and_return({cafe_latte: 2, blueberry_muffin: 1})
  end
  context "when passing an order to CalculateOrder" do
    it "it will calculate a subtotal per order line" do
      expect(calculate_total.subtotal).to eq({cafe_latte: "2 x $9.50", blueberry_muffin: "1 x $4.05"})
    end

    it "will calculate the total tax for the order" do
      expect(calculate_total.tax).to eq("$1.17")
    end

    it "will calculate the total value of the order" do
      expect(calculate_total.total).to eq("$14.72")
    end
  end

end
