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
      @till.add_order_item(item: "banana", quantity: 7)
      expect(@till.order.first[:item]).to eq("banana")
      expect(@till.order.first[:quantity]).to eq(7)
    end

    it 'should be capable of receiving multiple items and quantity' do
      @till.add_order_item(item: "banana", quantity: 7)
      @till.add_order_item(item: "apple", quantity: 4)
      expect(@till.order.length). to eq(2)
    end

    it 'should be able to be reset for the next customer' do
      @till.add_order_item(item: "banana", quantity: 7)
      @till.reset_order
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

    it 'should know the price of each item - Affogato' do
      expect(@till.price_of("Affogato")).to eq(14.80)
    end

    it 'should add the unit price of the item to the order' do
      @till.add_order_item(item: "Cafe Latte", quantity: 1)
      expect(@till.order.first[:unit_price]).to eq(4.75)
    end


  end

end
