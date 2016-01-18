require 'till'

describe Till do
  subject(:till) {described_class.new(read_json_klass, file_klass, json_klass, filename, calculate_total_klass, receipt_printer_klass)}
  let(:read_json_klass) {double(:read_json_klass)}
  let(:file_klass) {double(:file_klass)}
  let(:json_klass) {double(:json_klass)}
  let(:filename) {:filename}
  let(:calculate_total_klass) {double(:calculate_total_klass)}
  let(:receipt_printer_klass) {double(:receipt_printer_klass)}
  let(:mock_data) {{prices: {cafe_latte: 1}}}
  before do
    allow(read_json_klass).to receive(:parse).and_return(mock_data)
  end

  context "when getting set up" do
    it "the till will initialize with a menu" do
      expect(till.prices).to eq({cafe_latte: 1})
    end
  end

  context "when passed an order" do
    let(:order) {double(:order)}
    it "will return a receipt" do
      allow(calculate_total_klass).to receive(:run).with(any_args).and_return(:totals)
      expect(receipt_printer_klass).to receive(:run).with(mock_data, :totals)
      till.print_receipt(order)
    end
  end
end
