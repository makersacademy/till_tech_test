require 'receipt_printer'

describe ReceiptPrinter do
  subject(:receipt_printer) {described_class.new(restaurant_data, totals)}
  let(:restaurant_data) {{:shopname => :the_coffee_connection,
                          :address => :'123_lakeside_way',
                          :phone => "16503600708"}}
  let(:totals) { {subtotal: {cafe_latte: "2 x $9.50", blueberry_muffin: "1 x $4.05"}, tax: "$1.17", total: "$14.72"} }
  context "when passed a hash of totals" do
    before do
      allow(Time).to receive(:new).and_return(Time.new(2016))
    end
    it "Receipt Printer will print a receipt" do
      expect(receipt_printer.run).to eq("\
2016.01.01 00:00:00\n\
The Coffee Connection\n\
123 Lakeside Way\n\
Phone: +1 (650) 360-0708\n\
  Cafe Latte         2 x $9.50\n\
  Blueberry Muffin   1 x $4.05\n\
Tax                      $1.17\n\
Total                   $14.72")
    end
  end

end
