require 'byebug'

Given /^I am at a cafe(?: with a sales tax of "(.*?)")?$/ do |tax_rate|
  @till = Till.new({'Cafe Latte' => 4.5})
end

Given /^I have ordered "(.*?)"$/ do |item|
  @till.receive_order(Order.new(item))
end

Then(/^my receipt shows an itemized list of my order$/) do
  @receipt = Receipt.new @till.orders
  receipt.print[:items]
end

Then(/^my receipt should show me the total$/) do
  @receipt.print[:total] 
end
