require './lib/receipt'
require './lib/cafe'
require 'byebug'

Given /^I am at a cafe(?: with a sales tax of "(.*?)")?$/ do |tax_rate|
  @location = Cafe.new(tax: tax_rate.to_f)
  @till = Till.new({'Cafe Latte' => 4.5, 'Spaghetti' => 5.0,
                    'Wine'       => 3.0})
end

Given /^I have ordered "(.*?)"$/ do |item|
  @till.receive_order(Order.new(item))
end

Then(/^my receipt shows an itemized list of my order$/) do
  
  @receipt = Receipt.new @till.orders, @location
  @receipt.print[:items]
end

Then(/^my receipt should show me the total$/) do
  @receipt = Receipt.new @till.orders, @location
  @receipt.print[:total] 
end
