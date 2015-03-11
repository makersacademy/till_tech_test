require './lib/order'

describe Order do

  describe 'can be assigned' do

    it 'a price' do
      order       = Order.new(name: 'spaghetti', price: 3.0)
      
      expect(order.cost).to eq 3
    end

    it 'a discount value effecting its cost' do
      order = Order.new name: 'Jam Tart', price: 5.0, discount: '5%'

      expect(order.cost).to eq 4.75 
    end

  end

end
