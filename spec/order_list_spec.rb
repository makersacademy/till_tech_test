require './lib/order_list'

describe OrderList do

  let(:spaghetti_order) { double('order', cost: 5.0, name: 'spaghetti',:cost= => nil)}
  let(:coffee_order)    { double('coffee',cost: 3.0, name: 'coffee' ,  :cost= => nil)}
  let(:order_list)      { OrderList.new }

  describe OrderList do

    it 'prints itemization and total of orders' do
      order_list.receive_order(spaghetti_order)
      2.times { order_list.receive_order(coffee_order) } 

      expect(order_list.print).to eq ({ items: [
          { name: 'spaghetti', quantity: 1, cost:   5.0 },
          { name: 'coffee'   , quantity: 2, cost: 6.0 }], items_total: 11.0})
    end
  end
end

