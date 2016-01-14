require 'till'

describe Till do
  subject(:till) {described_class.new(read_json_klass, file_klass, json_klass, filename)}
  let(:read_json_klass) {double(:read_json_klass)}
  let(:file_klass) {double(:file_klass)}
  let(:json_klass) {double(:json_klass)}
  let(:filename) {:filename}

  context "when getting set up" do
    before do
      allow(read_json_klass).to receive(:parse).and_return({cafe_latte: 1})
    end
    it "the till will initialize with a menu" do
      expect(till.menu).to eq({cafe_latte: 1})
    end
  end

  context "when passed an order" do
    let(:order) {double(:order)}
    it "will return a receipt" do
      allow(:order).to receive(:check_order).and_return({cafe_latte: 1, blueberry_muffin: 2})
      expect(till.print_receipt(order)).to eq(
        "Cafe Latte x1  4.75\n
        Blueberry Muffin x2 9.50\n
        Tax $1.23
        Total $15.48")
    end
  end
end
