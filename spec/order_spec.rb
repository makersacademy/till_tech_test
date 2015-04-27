require_relative '../app/lib/order'

describe 'an order' do

  before(:each) do
    @order = Order.new
  end

  describe 'initialising an order' do

    it 'should be empty when initialised' do
      expect(@order.order_list).to be_empty
    end

  end

  describe 'adding an item to an order' do

    it 'should accept an item and a quantity into an order' do
      @order.add_item('Cafe Latte', 2)
      expect(@order.order_list.first[:item]).to eq('Cafe Latte')
      expect(@order.order_list.first[:quantity]).to eq(2)
    end

    it 'should be able to hold multiple order lines' do
      @order.add_item('Cafe Latte', 2)
      @order.add_item('Americano', 3)
      expect(@order.order_list.length).to eq (2)
    end

  end

end
