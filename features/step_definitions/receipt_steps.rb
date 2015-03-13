require './features/support/env'
require 'byebug'

Given(/^I am at a cafe with a sales tax of "(.*?)"$/) do |tax|
  receipt.evaluators[:tax] = Tax.new(tax.to_f)
end

Given(/^I (?:have ordered|order) "(.*?)"(?:$| at a cost of "(\d\.\d*)"$)/) do |order, cost|
  @cost = cost || 3
  order_list.receive_order Order.new({name: order, price: @cost})
end

Given(/^I have ordered a discounted "(.*?)"$/) do |order|
  @price_to_be_discounted = 5.0
  order_list.receive_order Order.new({name: "Muffin", price: @price_to_be_discounted,
                                      discount: "5%"}) 
end

Then(/^my receipt shows an itemized list of my order$/) do
  expect(receipt.print[:order]).to have_key :items 
end

Then(/^my receipt shows a subtotal of "(\d\.\d*)"$/) do |subtotal|
  expect(receipt.print[:order][:total]).to eq subtotal
end

Then(/^my receipt shows a tax of "(\d\.\d*)"$/) do |tax|
  expect(receipt.print[:tax][:total]).to eq tax
end

Then(/^my receipt shows a discounted cost$/) do
  expect(receipt.print[:total] < @price_to_be_discounted).to eq true 
end

Transform /^\d\.\d*$/ do |float_string|
  float_string.to_f
end


