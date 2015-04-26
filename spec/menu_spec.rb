require 'spec_helper'
require 'menu'

describe 'Menu' do

let(:menu) {Menu.new}

it "can list all the menu items" do
  expect(menu.all_items_with_prices.count).to eq(15)
end

it "can retrieve the price of an item" do
  expect(menu.item_price("Tea")).to eq(3.65)
end

end