require './lib/order_list'

describe OrderList do

  let(:spaghetti_order) { double('spaghetti', cost: 5.0, 
                                 print: {cost: 5.0, name: 'spaghetti'}, :cost= => nil)}
  let(:coffee_order)    { double('coffee', cost: 3.0, print: {cost: 3.0, name: 'coffee'},
                                 :cost= => nil)}
  let(:order_list)      { OrderList.new }

  describe OrderList do

    it 'prints itemization and total of orders' do
      order_list.receive_order(spaghetti_order)
      2.times { order_list.receive_order(coffee_order) } 

      expect(order_list.print).to eq ({order: { items: [
          { name: 'spaghetti', quantity: 1, cost:   5.0 },
          { name: 'coffee'   , quantity: 2, cost: 6.0 }], total: 11.0}})
    end

    it 'condenses identical orders into single orders' do
      double_order = Array.new(2) { { name: 'coffee', cost: 3.0 } }

      expect(order_list.condense(double_order)).to eq([{ name: 'coffee', cost: 6.0, 
                                                        quantity: 2 }])
    end
  end
end

