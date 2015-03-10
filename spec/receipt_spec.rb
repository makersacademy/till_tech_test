require './lib/receipt'

describe Receipt do

  let(:spaghetti_order) { double('order', cost: 5.0, name: 'spaghetti',:cost= => nil)}
  let(:coffee_order)    { double('coffee',cost: 3.0, name: 'coffee' ,  :cost= => nil)}
  let(:cafe)            { double('Cafe', calculate: 0.4 )}
  let(:receipt) { Receipt.new([spaghetti_order, spaghetti_order], cafe)}

  describe 'outputs order information' do

    it 'about two orders of the same kind' do

      expect(receipt.print[:items]).to eq(
       [ { name: 'spaghetti', quantity: 2, cost: 10 } ])
    end

    it 'about two orders of a different kind' do
      receipt = Receipt.new([spaghetti_order, coffee_order, coffee_order], cafe) 

      expect(receipt.print[:items]).to eq(
        [ { name: 'spaghetti', quantity: 1, cost:   5.0 },
          { name: 'coffee'   , quantity: 2, cost: 6.0 } ])
    end
  end

  describe 'calculates footer values' do

    it 'adds up subtotal of items' do
      expect(receipt.print[:subtotal]).to equal 10.0
    end

    it 'calculates tax' do
      expect(receipt.print[:tax]     ).to equal 0.4
    end

    it 'calculates total' do
      expect(receipt.print[:total]   ).to equal 10.4
    end
  end
end

