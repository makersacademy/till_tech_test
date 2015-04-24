require 'item'
require_relative 'spec_helper'

describe 'Item' do

  it "should have a name" do
    item = Item.new("Tea")
    expect(item.name).to eq("Tea")
  end

  it "should have a price" do
    item = Item.new("Tea", 3.65)
    expect(item.price).to eq(3.65)
  end

end