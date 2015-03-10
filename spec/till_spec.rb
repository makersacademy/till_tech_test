require './lib/till'
require 'json'

describe Till do

  let(:spaghetti_order) { double('order', cost: 5, name: 'spaghetti', :cost= => nil)}
  let(:till)            { Till.new }

  describe 'outputs' do

    it 'order information' do
      
      till.tax_rate = 0.04
      till.receive_order(spaghetti_order, 5.0)
      till.receive_order(spaghetti_order, 5.0)

      expect(till.receipt).to eq({
        items: [ { name: 'spaghetti', quantity: 2, cost: 10 } ],
        subtotal: 10,
        tax: 0.4,
        total: 10.4})
    end
  end

  describe 'knows the cost of orders' do

    it 'when they are received' do
      till.receive_order(spaghetti_order, 5.0)

      expect(till.orders.sample.cost).to eq 5
    end
  end

end


