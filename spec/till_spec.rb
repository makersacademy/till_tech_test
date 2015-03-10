require './lib/till'

describe Till do

  let(:spaghetti_order) { double('order', cost: 5.0, name: 'spaghetti',:cost= => nil)}
  let(:coffee_order)    { double('coffee',cost: 3.0, name: 'coffee' ,  :cost= => nil)}
  let(:till)            { Till.new }

  describe 'knows the cost of orders' do

    it 'when they are received' do
      till.receive_order(spaghetti_order, 5.0)

      expect(till.orders.sample.cost).to eq 5
    end
  end

end


