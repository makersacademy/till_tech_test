require 'till_factory'
require 'order'

describe "feature testing" do
  context "Jane's order" do

    it "receipt printed corresponds to supplied order" do
      jane_receipt = "\
2016.01.01 00:00:00\n\
The Coffee Connection\n\
123 Lakeside Way\n\
Phone: +1 (650) 360-0708\n\
  Cafe Latte         2 x $9.50\n\
  Blueberry Muffin   1 x $4.05\n\
  Choc Mudcake       1 x $6.40\n\
Tax                      $1.72\n\
Total                   $21.67"

      allow(Time).to receive(:new).and_return(Time.new(2016))
      new_till = TillFactory.build("hipstercoffee.json")
      janes_order = Order.new
      janes_order.add(:cafe_latte, 2)
      janes_order.add(:blueberry_muffin, 1)
      janes_order.add(:choc_mudcake)
      expect(new_till.print_receipt(janes_order)).to eq(jane_receipt)
    end
  end

  context "John's order" do
    it "receipt printed corresponds to supplied order" do
      john_receipt = "\
2016.01.01 00:00:00\n\
The Coffee Connection\n\
123 Lakeside Way\n\
Phone: +1 (650) 360-0708\n\
  Americano         4 x $15.00\n\
  Tiramisu          2 x $22.80\n\
  Blueberry Muffin  5 x $20.25\n\
Tax                      $5.02\n\
Total                   $63.07"
    end
  end
end
