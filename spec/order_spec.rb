require "./lib/order"

describe Order do
  
  let(:spaghetti) { Order.new(name: "spaghetti", price: 3.0) }

  describe "can be assigned" do

    it "a discount value effecting its cost" do
      order = Order.new name: "Jam Tart", price: 5.0, discount: "5%"
      expect(order.cost).to eq 4.75 
    end

  end

  it "prints its details" do
    expect(spaghetti.print).to eq({ name: "spaghetti", price: 3.0, cost: 3.0, discount: nil })
  end
end

