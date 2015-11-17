require 'spec_helper'
require './lib/till.rb'

describe Till do

  subject = described_class

  it 'reads coffee shop details in JSON format' do
    shop = { "shopName": "Happy Coffe Shop", "prices": { "Latte": 4, "Flat White": 3 }, "tax": 0.0864 }
    subject.coffee_shop = shop
    expect(subject.coffee_shop).to eq shop
  end

  it "reads customer's details in JSON format" do
    customer_order = { "customerName": "Jane", "order": { "Latte": 1, "Flat White": 2} }
    subject.customer_order = customer_order
    expect(subject.customer_order).to eq customer_order
  end

  it "produces line totals" do
    shop = { "shopName": "Happy Coffe Shop", "prices": { "Latte": 4, "Flat White": 3 }, "tax": 0.0864 }
    customer_order = { "customerName": "Jane", "order": { "Latte": 1, "Flat White": 2} }
    subject.coffee_shop = shop
    subject.customer_order = customer_order

    lines = { "Latte": { "quantity": 1, "item_price": 4, "line_total": 4 }, "Flat White": { "quantity": 2, "item_price": 3, "line_total": 6 } }
    expect(subject.line_entries).to eq lines
  end

  it "calculates the total price of the order" do
    shop = { "shopName": "Happy Coffe Shop", "prices": { "Latte": 4, "Flat White": 3 }, "tax": 0.0864 }
    customer_order = { "customerName": "Jane", "order": { "Latte": 1, "Flat White": 2} }
    subject.coffee_shop = shop
    subject.customer_order = customer_order
    expect(subject.total_before_tax).to eq 10
  end

  it "calculates the tax of an order" do
    shop = { "shopName": "Happy Coffe Shop", "prices": { "Latte": 4, "Flat White": 3 }, "tax": 0.0864 }
    customer_order = { "customerName": "Jane", "order": { "Latte": 1, "Flat White": 2} }
    subject.coffee_shop = shop
    subject.customer_order = customer_order
    expect(subject.bill_tax).to eq 0.86
  end



end
