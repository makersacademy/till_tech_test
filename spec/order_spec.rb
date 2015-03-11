require './lib/order'

describe Order do

  describe 'can be assigned' do

    it 'a cost' do
      order       = Order.new('spaghetti')
      order.cost = 3 
      
      expect(order.cost).to eq 3
    end

    it 'a discount value effecting its cost' do
      order = Order.new 'Jam Tart' 
      order.cost     = 5.0
      order.discount = "5%"

      expect(order.cost).to eq 4.75 
    end

  end

end
