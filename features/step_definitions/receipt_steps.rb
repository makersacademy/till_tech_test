require 'byebug'

Given /^I am at a cafe(?: with a sales tax of "(.*?)")?$/ do |tax_rate|
  @till = Till.new
  @till.tax_rate = tax_rate.to_f || 0.04
end

Given /^I have ordered "(.*?)" at a cost of "(.*?)"$/ do |item, price|
  @till.receive_order(Order.new(item), price.to_f)
end

Then(/^my receipt should show "(.*?)" with a quantity of "(.*?)" and a cost of "(.*?)"$/) do |name, quantity, cost|
  expect(@till.receipt[:items]).to eq([{
    name:     name,
    quantity: quantity.to_i,
    cost:     cost.to_f}])
end

Then(/^my receipt should show a total of "(.*?)"$/) do |total|
  expect(@till.receipt[:total]).to eq total.to_f
end

