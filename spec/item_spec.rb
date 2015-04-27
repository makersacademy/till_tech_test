require 'item'
require_relative 'spec_helper'

describe 'Item' do

let(:item) {Item.new("Tea", 3.65)}

  it "should have a name" do
    expect(item.name).to eq("Tea")
  end

  it "should have a price" do
    expect(item.price).to eq(3.65)
  end

end