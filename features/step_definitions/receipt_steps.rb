require 'byebug'


Given(/^I am at "(.*?)"$/) do |arg1|
  @till = Till.new(example["prices"].sample)
end

Given(/^I have ordered "(\d*?)" "(.*?)"$/) do |quantity, item|
  quantity.to_i.times do
    @till.receive_order(Order.new(item))
  end
end

Then(/^I should have "(.*?)" on my receipt$/) do |arg1|
  expect(@till.receipt[:items]).to eq(
    [{name: 'Cafe Latte',
      quantity: 2,
      cost: 9.5 }])
end

def example
  JSON.parse(File.read('./features/support/shop_examples.json')).sample
end

