require 'discount'

describe 'discounts' do

  let(:dummy_receipt) { Class.new { extend Discounts } }

  describe 'calculating a discount amount' do

    it 'should calculate a discount based on amount to be discounted and discount rate' do
      expect(dummy_receipt.calculate_discount(85, 10)).to eq(8.5)
    end

  end

  describe 'calculating a 5% discount when net total above 50' do

    it 'should calculate a discount of 5% on an order with a pre-tax total over $50' do
      allow(dummy_receipt).to receive(:net_total).and_return(55)
      expect(dummy_receipt.discount_total_price).to eq(2.75)
    end

    it 'should not offer a discount on an order where pre-tax total is less than $50' do
      allow(dummy_receipt).to receive(:net_total).and_return(49)
      expect(dummy_receipt.discount_total_price).to eq(0)
    end

  end

  describe 'calculating a discount of 10% on all mufins' do

    it 'should offer a discount of 10% on the total spend on muffins' do
      allow(dummy_receipt).to receive(:line_price).with({:item=>"Blueberry Muffin", :quantity=>2}).and_return(8.10)
      dummy_order = [{item: 'Blueberry Muffin', quantity:2}, {item: 'Tea', quantity: 3}]
      allow(dummy_receipt).to receive(:order).and_return(dummy_order)
      expect(dummy_receipt.discount_muffins).to eq(0.81)
    end

    it 'should not offer a discount if no muffins are ordered' do
      dummy_order = [{item: 'Tea', quantity: 3}]
      allow(dummy_receipt).to receive(:order).and_return(dummy_order)
      expect(dummy_receipt.discount_muffins).to eq(0)
    end

  end

  describe 'calculating the total of all discounts' do

    it 'should total up all applicable discounts' do
      allow(dummy_receipt).to receive(:net_total).and_return(55)
      allow(dummy_receipt).to receive(:discount_muffins).and_return(0.81)
      expect(dummy_receipt.discount_total).to eq(3.56)
    end

  end

end
