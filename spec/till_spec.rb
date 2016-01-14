require './app/till'

describe Till do

  subject(:till) { described_class.new }

  context "#intialize" do

    it "initializes with shop details" do
      expect(till.shop_details).to eq(Till::SHOP_DETAILS)
    end
  end

  context "#calculate_sum" do

    it "calculates the total sum for an order" do
      order = {"Cafe Latte":1, "Flat White":2}
      expect(till.calculate_sum(order)).to eq(14.25)
    end
  end

  context "#calculate_tax" do

    it "calculates the total tax for an order" do
      expect(till.calculate_tax(14.25)).to eq(1.23)
    end
  end

end
