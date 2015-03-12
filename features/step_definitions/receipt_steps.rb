require './features/support/env'

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


