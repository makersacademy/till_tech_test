require 'spec_helper'
require 'order'

describe 'Order' do

  let(:order) {Order.new}
  let(:item) {double('Item')}
  let(:item1) {double('Item', :price => 3)}
  let(:item2) {double('Item', :price => 4)}

  it "can have an item added to the current order" do
    order.add_to_order(item)
    expect(order.current_order).to include(item)
  end

  it "knows the quantity for each item in the order" do
    order.add_to_order(item, 2)
    expect(order.current_order).to include(item => 2)
  end

  it "can calculate the total pre-tax price" do
    order.add_to_order(item1, 2)
    order.add_to_order(item2, 3)
    expect(order.total_pretax_price).to eq(18)
  end
end