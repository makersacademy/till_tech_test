require_relative '../app/model/till'
require 'json'
describe Till do

  data = JSON.parse(File.open("hipstercoffee.json", "r").read)
  subject(:till){described_class.new(data)}
  order = {
    name: "Jane",
    items: [
      {"Cafe Latte": 2},
      {"Blueberry Muffin": 1},
      {"Choc Mudcake": 1}
    ]
  }
  line = order[:items][0]

  describe "#calculate_line_total" do
    it "calculates the total cost of one line of an order" do
      expect(till.calculate_line_total(line)).to eq(9.50)
    end
  end

  describe "#calculate_base_total" do
    it "calculates the total cost of an order before tax" do
      expect(till.calculate_base_total(order)).to eq(19.95)
    end
  end

  describe "#calculate_tax" do
    it "calculates the amount of tax payable on an order" do
      base_total = till.calculate_base_total(order)
      expect(till.calculate_tax(base_total)).to eq(1.72)
    end
  end

  describe "#total" do
    it "return the full total" do
      expect(till.total(order)).to eq(21.67)
    end
  end

  describe "#take_payment(amount)" do
    before(:each) do
      till.total(order)
    end
    it "resets the bill" do
      till.take_payment(25)
      expect(till.order_total).to eq(0)
    end
    it"returns the correct change" do
      expect(till.take_payment(25)).to eq(3.33)
    end
    it "alerts the operator if incorrect payment is made" do
      expect{till.take_payment(20)}.to raise_error("The amount given is less than the cost of the order")
    end
  end
end
