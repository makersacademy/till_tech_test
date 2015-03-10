require './lib/receipt'

describe Receipt do

  let(:spaghetti_order) { double('order', cost: 5.0, name: 'spaghetti',:cost= => nil)}
  let(:coffee_order)    { double('coffee',cost: 3.0, name: 'coffee' ,  :cost= => nil)}

  describe 'outputs order information' do

    it 'about two orders of the same kind' do
      receipt = Receipt.new([spaghetti_order, spaghetti_order])

      expect(receipt.print).to eq({
        items: [ { name: 'spaghetti', quantity: 2, cost: 10 } ],
        subtotal: 10,
        tax: 0.4,
        total: 10.4})
    end

    it 'about two orders of a different kind' do
      receipt = Receipt.new([spaghetti_order, coffee_order, coffee_order]) 

      expect(receipt.print).to eq({
        items: [ { name: 'spaghetti', quantity: 1, cost:   5.0 },
                   { name: 'coffee'   , quantity: 2, cost: 6.0 }],
        subtotal: 11.0,
        tax:      0.44,
        total:    11.44 })
    end
  end
end

