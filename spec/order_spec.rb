require './lib/order'

describe Order do

  describe 'can be assigned' do

    it 'a price' do
      order       = Order.new('spaghetti')
      order.price = 3 
      
      expect(order.price).to eq 3
    end

    it 'a discount value effecting its price' do
      order = Order.new 'Jam Tart' 
      order.price     = 5.0
      order.discount = "5%"

      expect(order.price).to eq 4.75 
    end

  end

end
