require 'order'

describe Order do

  let(:order){Order.new}

  context 'On initialization' do
    it 'Is empty' do
      expect(order.list_current_order).to be_empty
    end
  end
end