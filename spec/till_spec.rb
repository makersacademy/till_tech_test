require './app/till'

describe Till do

  subject(:till) { described_class.new }

  context "#intialize" do

    it "initializes with shop details" do
      expect(till.shop_details).to eq(Till::SHOP_DETAILS)
    end
  end

end
