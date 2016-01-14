require_relative '../app/model/till'
require 'json'
describe Till do
    data = File.open("hipstercoffee.json", "r").read
    data = JSON.parse(data)
  subject(:till){described_class.new(data)}
    line = {"Cafe Latte": 2}
    order = {
      name: "Jane",
      items: [
        {"Cafe Latte": 2},
        {"Blueberry Muffin": 1},
        {"Choc Mudcake": 1}
      ]
    }
  context "when supplied resaurant data" do
    it "can return the menu for the restaurant" do
      expect(till.print_menu).to eq("Cafe Latte"=>4.75,
        "Flat White"=>4.75,
        "Cappucino"=>3.85,
        "Single Espresso"=>2.05,
        "Double Espresso"=>3.75,
        "Americano"=>3.75,
        "Cortado"=>4.55,
        "Tea"=>3.65,
        "Choc Mudcake"=>6.4,
        "Choc Mousse"=>8.2,
        "Affogato"=>14.8,
        "Tiramisu"=>11.4,
        "Blueberry Muffin"=>4.05,
        "Chocolate Chip Muffin"=>4.05,
        "Muffin Of The Day"=>4.55)
    end
  end

  describe "#calculate_line_total" do
    it "calculates the total cost of one line of an order" do
      expect(till.calculate_line_total(line)).to eq(9.50)
    end
  end

  describe "#calculate_total" do
    it "calculates the total cost of an order" do
      expect(till.calculate_total(order)).to eq(19.95)
    end
  end
end
