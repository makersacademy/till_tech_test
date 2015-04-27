require 'customer'
require 'spec_helper'

describe 'Customer' do

let(:customer){Customer.new("Bob")}

it "should have a name" do
  expect(customer.name).to eq("Bob")
end

end