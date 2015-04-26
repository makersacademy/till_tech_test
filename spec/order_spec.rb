require 'spec_helper'
require 'order'

describe 'Order' do

  let(:order) {Order.new}
  let(:item) {double('Item')}
  let(:customer1) {double('Customer', :name => "Joe")}
  let(:customer2) {double('Customer', :name => "Bob")}
  let(:item1) {double('Item', :price => 3, :name => "Tea")}
  let(:item2) {double('Item', :price => 4, :name => "Coffee")}
  let(:item_muffin) {double('Item', :price => 5, :name => "Blueberry Muffin")}

  def order_items
    order.add_item_to_order(customer1,item1, 2)
    order.add_item_to_order(customer2,item2, 3)
  end

  it "can have an item added to the current order" do
    order.add_item_to_order(customer1, item)
    expect(order.current_order[customer1]).to include(item)
  end

  it "knows the quantity for each item in the order" do
    order.add_item_to_order(customer1,item, 2)
    expect(order.current_order[customer1]).to include(item => 2)
  end

  it "can add items for different customers" do
    order_items
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

  it "can calculate the total (pre-tax) price of an item of a particular customer" do
    order_items
    order.add_item_to_order(customer1,item2, 2)
    expect(order.total_price_per_item(customer1, item1)).to eq(6)
  end

  it "can apply a ten percent discount to muffins" do
    order.add_item_to_order(customer1,item_muffin, 2)
    expect(order.total_price_per_item(customer1, item_muffin)).to eq(9)
  end

  it "can calculate the total (pre-tax) price for a particular customer" do
    order_items
    expect(order.total_price_per_customer(customer1)).to eq(6)
  end

  it "can calculate the overall total pre-tax price" do
    order_items
    expect(order.total_pretax_price).to eq(18)
  end

  it "can calculate the tax due" do
    order_items
    expect(order.calculate_tax(order.total_pretax_price)).to eq(1.56)
  end

  it "can calculate the after-tax price" do
    order_items
    expect(order.total_posttax_price).to eq(16.44)
  end

end


