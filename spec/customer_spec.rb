require 'customer'
require 'spec_helper'

describe 'Customer' do

let(:customer){Customer.new("Bob")}

it "should have a name" do
  expect(customer.name).to eq("Bob")
end

xit "should be able to place an order" do
  customer.place_order("Tea",2)
  allow(order).to receive(:current_order)
  expect(customer.order.current_order).to eq("Tea",2)

end

end