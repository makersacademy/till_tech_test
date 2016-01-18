require 'calculate_total'

describe CalculateTotal do
  subject(:calculate_total) {described_class.new(prices, order)}
  let(:order) {double(:order)}
  let(:prices) {{cafe_latte: 4.75, blueberry_muffin: 4.05}}

  before do
    allow(order).to receive(:check_order).and_return({cafe_latte: 2, blueberry_muffin: 1})
  end

  context "when passing an order to CalculateTotal" do
    it "returns a subtotal per order line, the total tax and the total value of the order" do
      subtotals = {cafe_latte: "2 x $9.50", blueberry_muffin: "1 x $4.05"}
      expect(described_class.run(prices, order)).to eq({subtotal: subtotals, tax: "$1.17", total: "$14.72"})
    end
  end

end
