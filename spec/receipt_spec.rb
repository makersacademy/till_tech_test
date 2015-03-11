require './lib/receipt'

describe Receipt do

  let(:spaghetti_order) { double('order', cost: 5.0, name: 'spaghetti',:cost= => nil)}
  let(:coffee_order)    { double('coffee',cost: 3.0, name: 'coffee' ,  :cost= => nil)}
  let(:expensive_order) { double('caviar',cost: 90.0,name: 'caviar' ,  :cost= => nil)}
  let(:cafe)            { double('Cafe', calculate_tax: 0.4, info: {name: "Cafe"})}

  let(:receipt) { Receipt.new(orders:[spaghetti_order, spaghetti_order], location: cafe)}

  describe 'outputs order information' do

    it 'about two orders of the same kind' do

      expect(receipt.print[:items]).to eq(
       [ { name: 'spaghetti', quantity: 2, cost: 10 } ])
    end

    it 'about two orders of a different kind' do
      receipt = Receipt.new(orders: [spaghetti_order, coffee_order, coffee_order], 
                            location: cafe) 

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

    it 'calculates 10% discount when subtotal is above 50$' do
      receipt = Receipt.new(orders:[expensive_order], location: cafe)

      expect(receipt.print[:total]).to equal 81.4
    end
  end

  describe 'calculates change' do

    it 'when payment matches cost' do
      receipt.receive_payment(12.0)
      expect(receipt.print[:change]).to equal 1.6 
    end

    it 'when payment is more than cost' do
      receipt.receive_payment(12.5)
      expect(receipt.print[:change]).to equal 2.1
    end
  end
end

