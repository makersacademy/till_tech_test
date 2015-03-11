require 'till'
require 'json'

describe 'a till' do

  before(:each) do
    @till = Till.new
  end

  describe 'taking an order' do

    it 'should be empty when initialized' do
      expect(@till.order).to be_empty
    end

    it 'should be capable of receiving an item and a quantity' do
      @till.add_order_item(item: "Cortado", quantity: 3)
      expect(@till.order.first[:item]).to eq("Cortado")
      expect(@till.order.first[:quantity]).to eq(3)
    end

    it 'should be capable of receiving multiple items and quantity' do
      @till.add_order_item(item: "Americano", quantity: 2)
      @till.add_order_item(item: "Tea", quantity: 1)
      expect(@till.order.length). to eq(2)
    end

    it 'should be able to be reset for the next customer' do
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      @till.new_order
      expect(@till.order).to be_empty
    end

  end

  describe 'calculating the cost of an order line' do

    it 'should load the prices when till initialised' do
      expect(@till.prices.length).to eq(15)
    end

    it 'should know the price of each item - Cafe Latte' do
      expect(@till.price_of("Cafe Latte")).to eq(4.75)
    end

    it 'should know the price of each item - Choc Mudcake' do
      expect(@till.price_of("Choc Mudcake")).to eq(6.40)
    end

    it 'should know the price of each item - Affogato' do
      expect(@till.price_of("Affogato")).to eq(14.80)
    end

    it 'should calculate the price of a line of the order' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      expect(@till.line_price(@till.order[0])).to eq(9.50)
    end

  end

  describe 'calculating the total price of an order' do

    it 'should total up the net total (pre-tax) of all lines in the order' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      expect(@till.net_total).to eq(13.55)
    end

    it 'should calculate the tax due on the net total' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      expect(@till.order_tax).to eq(1.17)
    end

  end

  describe 'creating a receipt' do

    it 'should output each line item total, tax and total' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.generate_receipt).to eq('Cafe Latte 2 x 4.75,Blueberry Muffin 1 x 4.05,Choc Mudcake 1 x 6.40,Tax 1.72,Total 21.67')
    end

  end

  describe 'taking payment' do

    it 'should provide the amount of change from cash offered' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.take_payment(25)).to eq('The change is 3.33')
    end

    it 'should return a message if amount tendered is less than total' do
      @till.add_order_item(item: "Cafe Latte", quantity: 2)
      @till.add_order_item(item: "Blueberry Muffin", quantity: 1)
      @till.add_order_item(item: "Choc Mudcake", quantity: 1)
      expect(@till.take_payment(20)).to eq('The amount tendered is 1.67 less than the total')
    end

  end

  describe 'discounting' do

    it 'should calculate a discount of 5% on an order with a pre-tax total over $50' do
      @till.add_order_item(item: "Cafe Latte", quantity: 11)
      expect(@till.discount).to eq(2.61)
    end

    it 'should not offer a discount on an order where pre-tax total is less than $50' do
      @till.add_order_item(item: "Cafe Latte", quantity: 10)
      expect(@till.discount_total_price).to eq(0)
    end

    it 'should offer a discount of 10% on muffins' do
      @till.add_order_item(item: "Chocolate Chip Muffin", quantity: 2)
      expect(@till.discount_muffins).to eq(0.81)
    end

    it 'discounts should work independently of each other' do
      @till.add_order_item(item: "Chocolate Chip Muffin", quantity: 13)
      expect(@till.discount).to eq(7.90)
    end

  end

end
