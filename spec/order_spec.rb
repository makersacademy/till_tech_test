require 'spec_helper'
require 'order'

describe 'Order' do

  let(:order) {Order.new}
  let(:item) {double('Item')}
  let(:customer1) {double('Customer', :name => "Joe")}
  let(:customer2) {double('Customer', :name => "Bob")}
  let(:item1) {double('Item', :price => 3)}
  let(:item2) {double('Item', :price => 4)}

  it "can have an item added to the current order" do
    order.add_item_to_order(customer1, item)
    expect(order.current_order[customer1]).to include(item)
  end

  it "knows the quantity for each item in the order" do
    order.add_item_to_order(customer1,item, 2)
    expect(order.current_order[customer1]).to include(item => 2)
  end

  it "can add items for different customers" do
    order.add_item_to_order(customer1, item1)
    order.add_item_to_order(customer2, item2)
    expect(order.current_order[customer1]).to include(item1)
    expect(order.current_order[customer2]).to include(item2)
  end

  it "can increase the item quantity" do
    order.add_item_to_order(customer1, item, 2)
    order.increase_item_quantity(customer1, item)
    expect(order.current_order[customer1]).to include(item => 3)
  end

  it "can decrease the item quantity" do
    order.add_item_to_order(customer1, item, 2)
    order.decrease_item_quantity(customer1, item)
    expect(order.current_order[customer1]).to include(item => 1)
  end

  it "can't decrease the item quantity below zero" do
    order.add_item_to_order(customer1, item)
    expect{order.decrease_item_quantity(customer1, item, 2)}.to raise_error
  end

  it "can calculate the total (pre-tax) price for a customer" do
    order.add_item_to_order(customer1,item1, 2)
    order.add_item_to_order(customer1,item2, 3)
    expect(order.total_price_per_customer(customer1)).to eq(18)
  end

  it "can calculate the overall total pre-tax price" do
    order.add_item_to_order(customer1,item1, 2)
    order.add_item_to_order(customer2,item2, 3)
    expect(order.total_pretax_price).to eq(18)
  end
end