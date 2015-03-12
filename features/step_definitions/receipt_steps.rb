require './features/support/env'

Given(/^I am at a cafe with a sales tax of "(.*?)"$/) do |tax|
  receipt.evaluators[:tax] = Tax.new(tax.to_f)
end

Given(/^I (?:have ordered|order) "(.*?)"(?:$| at a cost of "(.*?)"$)/) do |order, cost|
  @cost = (cost || 3).to_f
  order_list.receive_order Order.new({name: order, price: @cost})
end

Then(/^my receipt shows an itemized list of my order$/) do
  expect(receipt.print).to have_key :items 
end

Then(/^my receipt shows a subtotal of "(.*?)"$/) do |subtotal|
  expect(receipt.print[:items_total]).to eq subtotal.to_f
end

Then(/^my receipt shows a tax of "(.*?)"$/) do |tax|
  expect(receipt.print[:tax]).to eq tax.to_f
end


