require 'byebug'
require './lib/tax'
require './lib/discount'
require './lib/payment'

FLOAT = Transform /^\d*\.\d*$/ do |float_string|
  float_string.to_f
end

Given(/^I am at a cafe with a sales tax of "(.*?)"$/) do |tax|
  receipt.evaluators[:tax] = Tax.new(tax.to_f)
end

Given(/^I am at a cafe with a discount on orders over "(#{FLOAT})"$/) do |discount|
  big_spend_evaluator = proc {|value| value > discount }
  receipt.evaluators[:discount] = Discount.new(discount: "10%", 
                                               discountable?: big_spend_evaluator)
end

Given(/^I (?:have ordered|order) "(.*?)"(?:$| at a cost of "(#{FLOAT})"$)/) do |order, cost|
  @cost = cost || 3
  order_list.receive_order create_order({name: order, price: @cost})
end

Given(/^I have ordered a discounted "(.*?)"$/) do |order|
  @price_to_be_discounted = 5.0
  order_list.receive_order create_order({name: "Muffin", price: @price_to_be_discounted,
                                     discount: "5%"}) 
end

Given(/^I have spent over "(#{FLOAT})"$/) do |total_spent|
  order_list.receive_order create_order({name: "Champagne", price: total_spent*2})
end

Then(/^my receipt shows an itemized list of my order$/) do
  expect(receipt.print[:order]).to have_key :items 
end

Then(/^my receipt shows a subtotal of "(#{FLOAT})"$/) do |subtotal|
  expect(receipt.print[:order][:total]).to eq subtotal
end

Then(/^my receipt shows a tax of "(#{FLOAT})"$/) do |tax|
  expect(receipt.print[:tax][:total]).to eq tax
end

Then(/^my receipt shows a discounted cost$/) do
  expect(receipt.print[:total] < @price_to_be_discounted).to eq true 
end

Then(/^my receipt shows a discounted grand total$/) do
  expect(receipt.print[:total] < receipt.print[:order][:total]).to eq true
end

Given(/^I have made a few orders$/) do
  steps %{
    Given I have ordered "Cafe Latte" at a cost of "3.0"    
    And I have ordered "Spaghetti" at a cost of "5.0"
  }
end

Given(/^I pay the balance of my bill$/) do
  receipt(payment: Payment.new(8.0))
end

Then(/^my receipt shows that I have paid$/) do
  expect(receipt.print[:payment][:remaining_balance]).to eq 0.0
end

