require 'receipt'

describe 'Receipt' do

  let(:receipt){Receipt.new(Order.new({menu: Menu.new, customer: 'Matteo'}))}

  context 'by default' do

    it 'should have the name of the shop' do
      expect(receipt.shop_name).to eq 'The Coffee Connection'
    end 

    it 'should have the address of the shop' do
      expect(receipt.shop_address).to eq '123 Lakeside Way'
    end 

    it 'should have the phone of the shop' do
      expect(receipt.shop_phone). to eq '16503600708'
    end
  end

  context 'calculating the total with taxes and discounts' do

    it 'should sum the item\'s for the line\'s total' do 
      receipt.order.add(2, 'Cappuccino')
      expect(receipt.items_total).to eq 7.7
      receipt.order.add(1, 'Choc Mudcake')
      expect(receipt.items_total).to eq 6.40
    end

    it 'should sum the item\'s prices for the total amount' do
      receipt.order.add(2, 'Cappuccino')
      receipt.order.add(1, 'Choc Mudcake')
      expect(receipt.total).to eq 15.32
    end

  end

  context 'paying' do

    it 'should not give change back if the payment is equal the total' do
      receipt.order.add(2, 'Cappuccino')
      receipt.receive_payment_of(8.37)
      expect(receipt.change).to eq nil
    end

    it 'should ask for more money if they don\'t cover the total' do
      receipt.order.add(2, 'Cappuccino')
      expect(receipt.receive_payment_of(3.0)).to eq 'Sorry, you still have to pay 5.37£ !'
    end

    it 'should give change if the payment is more then the total' do
      receipt.order.add(2, 'Cappuccino')
      receipt.receive_payment_of(10)
      expect(receipt.change).to eq 1.63
    end
  end
end
