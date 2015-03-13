require './features/support/env'
require 'byebug'

Given(/^I am at a cafe with a sales tax of "(.*?)"$/) do |tax|
  receipt.evaluators[:tax] = Tax.new(tax.to_f)
end

Given(/^I (?:have ordered|order) "(.*?)"(?:$| at a cost of "(.*?)"$)/) do |order, cost|
  @cost = (cost || 3).to_f
  order_list.receive_order Order.new({name: order, price: @cost})
end

Given(/^I have order a discounted "(.*?)"$/) do |order|
  @price_to_be_discounted = 5.0
  order_list.receive_order Order.new({name: "Muffin", price: @price_to_be_discounted,
                                      discount: "5%"}) 
end

Then(/^my receipt shows an itemized list of my order$/) do
  expect(receipt.print[:order]).to have_key :items 
end

Then(/^my receipt shows a subtotal of "(.*?)"$/) do |subtotal|
  expect(receipt.print[:order][:total]).to eq subtotal.to_f
end

Then(/^my receipt shows a tax of "(.*?)"$/) do |tax|
  expect(receipt.print[:tax][:total]).to eq tax.to_f
end

Then(/^my receipt shows a discounted cost$/) do
  expect(receipt.print[:total] < @price_to_be_discounted).to eq true 
end


